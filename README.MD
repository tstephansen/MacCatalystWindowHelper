# MacCatalyst Window Helper

## Description

This is a library meant to be used in dotnet MAUI apps that run on macOS.

## Usage

To use this library:

1. Compile it and copy libWindowHelper.dylib from the build folder to a folder inside your MAUI project. For example, if your folder structure is like MauiAppSolution/MauiApp1/MauiApp1.csproj then create the folder MauiAppSolution/MauiApp1/Libs and copy the file to that folder.

2. Edit your csproj file and add the following lines of code to it:

   ```xml
    <ItemGroup>
        <NativeReference Include="Libs\libWindowHelper.dylib" Kind="Dynamic" />
    </ItemGroup>
   ```

3. Create a service that can be injected which will control if windows are opaque or not (name it whatever but for this example we're going to assume it's named TransparentWindowService). An example is below.

   ```csharp
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
   ```

4. Inject the service where needed and call the MakeWindowsTransparent() method to make the app's windows transparent.
