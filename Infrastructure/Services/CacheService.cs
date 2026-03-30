using Application.IServices;
using Microsoft.Extensions.Caching.Distributed;
using System.Text.Json;

namespace Infrastructure.Services
{
    public class CacheService : ICacheService
    {
        private readonly IDistributedCache _cache;
        public CacheService(IDistributedCache cache ) { 
            _cache = cache;
        }

        public async Task<T?> GetAsync<T>(string key)
        {
            var serializedValue = await _cache.GetStringAsync(key);
            return serializedValue == null ? default : JsonSerializer.Deserialize<T>(serializedValue);
        }

        public async Task SetAsync<T>(string key, T value, TimeSpan? absoluteExpirationRelativeToNow = null)
        {
            if (value == null)
            {
                return;
            }
            var serializedValue= JsonSerializer.Serialize(value);
            var options=new DistributedCacheEntryOptions ()
                .SetAbsoluteExpiration(absoluteExpirationRelativeToNow ?? TimeSpan.FromMinutes(15));
            await _cache.SetStringAsync(key, serializedValue, options);

        }
    }
}
