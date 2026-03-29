using System.Threading.Tasks;

namespace Application.IServices
{
    public interface INotificationService
    {
        Task SendProductUpdateNotification(int productId, string message);
        Task SendMessageToUser(string userId, string message);
        Task AddConnectionToGroup(string connectionId, string groupName);
    }
}
