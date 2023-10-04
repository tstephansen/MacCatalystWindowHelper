using System.Runtime.InteropServices;
using Microsoft.Extensions.Logging;

namespace MauiApp1.Platforms.MacCatalyst;

public interface ITransparentWindowService
{
    void MakeWindowsTransparent();
}

public class TransparentWindowService : ITransparentWindowService
{
    private readonly ILogger<TransparentWindowService> _logger;
    public TransparentWindowService(ILogger<TransparentWindowService> logger)
    {
        _logger = logger;
    }
    
    public void MakeWindowsTransparent()
    {
        try
        {
            makeWindowsTransparent();
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error making the windows transparent");
        }
    }
    
    [DllImport("__Internal")]
    private static extern void makeWindowsTransparent();
}