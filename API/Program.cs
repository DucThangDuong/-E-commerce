using API.DTOs;
using API.Extensions;
using API.Logging;
using API.Middleware;
using FastEndpoints;
using FastEndpoints.Swagger;
using Infrastructure.Services;
using Serilog;

namespace API
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            builder.Host.UseSerilog((context, services, configuration) => configuration
                .ReadFrom.Configuration(context.Configuration)
                .ReadFrom.Services(services)
                .Enrich.FromLogContext()
                .Destructure.With<SensitiveDataDestructuringPolicy>());

            // ──────────── Dependency Injection Bootstrapping ────────────
            builder.Services.AddApiConfiguration(builder.Configuration)
                            .AddSwaggerConfiguration()
                            .AddDatabaseConfiguration(builder.Configuration, builder.Environment)
                            .AddApplicationServices(builder.Configuration)
                            .AddMessageBrokerConfiguration(builder.Configuration)
                            .AddCacheConfiguration(builder.Configuration)
                            .AddRateLimitingConfiguration()
                            .AddJwtAuthentication(builder.Configuration)
                            .AddLocalization();

            var app = builder.Build();

            // ──────────── Localization Configuration ────────────
            var supportedCultures = new[] { "vi", "en" };
            var localizationOptions = new RequestLocalizationOptions()
                .SetDefaultCulture(supportedCultures[0])
                .AddSupportedCultures(supportedCultures)
                .AddSupportedUICultures(supportedCultures);
            localizationOptions.ApplyCurrentCultureToResponseHeaders = true;
            app.UseRequestLocalization(localizationOptions);

            // ──────────── Global Exception Handling ────────────
            app.UseExceptionHandler(errorApp =>
            {
                errorApp.Run(async context =>
                {
                    var exceptionHandlerPathFeature = context.Features.Get<Microsoft.AspNetCore.Diagnostics.IExceptionHandlerPathFeature>();
                    if (exceptionHandlerPathFeature?.Error is Exception ex)
                    {
                        Log.Error(ex, "Unhandled exception occurred while processing request");
                    }

                    var localizer = context.RequestServices.GetRequiredService<Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource>>();

                    context.Response.StatusCode = 500;
                    context.Response.ContentType = "application/json";
                    var response = new ApiErrorResponse
                    {
                        Message = localizer["ERR_INTERNAL_SERVER"],
                        ErrorCode = "ERR_INTERNAL_SERVER",
                        TraceId = context.TraceIdentifier
                    };
                    await context.Response.WriteAsJsonAsync(response);
                });
            });

            // ──────────── Middlewares ────────────
            app.UseMiddleware<SecurityHeadersMiddleware>();
            app.UseMiddleware<XssSanitizationMiddleware>();
            
            app.UseRouting();
            app.UseCors("CORS");
            app.UseHttpsRedirection();
            
            app.UseAuthentication();
            app.UseMiddleware<LogContextMiddleware>();
            app.UseSerilogRequestLogging();
            app.UseMiddleware<AccessTokenBlacklistMiddleware>();
            app.UseAuthorization();
            
            app.UseRateLimiter();
            
            app.UseFastEndpoints(c => 
            {
                c.Errors.ResponseBuilder = (failures, ctx, statusCode) =>
                {
                    var localizer = ctx.RequestServices.GetRequiredService<Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource>>();
                    return new ApiErrorResponse
                    {
                        Message = localizer["ERR_VALIDATION_FAILED"],
                        ErrorCode = "ERR_VALIDATION_FAILED",
                        Errors = failures.Select(f => new 
                        {
                            field = f.PropertyName,
                            message = f.ErrorMessage
                        }),
                        TraceId = ctx.TraceIdentifier
                    };
                };
            });
            
            app.UseSwaggerGen();
            app.MapControllers();
            app.MapHub<NotificationHub>("/notifications");
            app.Run();
        }
    }
}
