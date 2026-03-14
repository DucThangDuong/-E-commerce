using Application.Interfaces;
using Application.IServices;
using FastEndpoints;
using Infrastructure;
using Infrastructure.Repositories;
using Infrastructure.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Text;
namespace API
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            builder.Services.AddControllers();
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddFastEndpoints();
            builder.Services.AddDbContext < EcommerceOrderSystemContext > (options =>
            {
                options.UseSqlServer(builder.Configuration["ConnectionStrings:Ecommerce"]);
            });
            builder.Services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
                .AddJwtBearer(options =>
                {
                    var key = Encoding.UTF8.GetBytes(builder.Configuration["SecretKey"] ?? string.Empty);
                    options.SaveToken = true;
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = false,
                        ValidateAudience = false,
                        ValidateLifetime = true,
                        RequireExpirationTime = true,
                        ValidateIssuerSigningKey = true,
                        RequireSignedTokens = true,
                        IssuerSigningKey = new SymmetricSecurityKey(key),
                        ClockSkew = TimeSpan.Zero
                    };
                    //    options.Events = new JwtBearerEvents
                    //    {
                    //        OnMessageReceived = context =>
                    //        {
                    //            var accessToken = context.Request.Query["access_token"];
                    //            var path = context.HttpContext.Request.Path;
                    //            if (!string.IsNullOrEmpty(accessToken) && path.StartsWithSegments("/notificationHub"))
                    //            {
                    //                context.Token = accessToken;
                    //            }
                    //            return Task.CompletedTask;
                    //        }
                    //    };
                });
            builder.Services.AddScoped < IJWTTokenServices, JwtTokenService > ();

            builder.Services.AddScoped < IUnitOfWork, UnitOfWork > ();
            builder.Services.AddScoped <ICustomerRepository,CustomerRepository> ();
            builder.Services.AddScoped <Application.Features.Customer.Commands.AddUserHandler> ();
            builder.Services.AddHttpContextAccessor();
            var app = builder.Build();
            app.UseRouting();
            app.UseHttpsRedirection();
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseFastEndpoints();
            app.MapControllers();

            app.Run();
        }
    }
}

