using System.Windows;
using System.Diagnostics;


using Microsoft.Extensions.DependencyInjection;

using Serilog;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Configuration;

//using ILogger = Microsoft.Extensions.Logging.ILogger;
using ILogger = Serilog.ILogger;

namespace Krypton
{
    public partial class App : Application
    {
        public LaunchOptions? Options { get; private set; }

        public IServiceProvider ServiceProvider { get; private set; }

        public App()
        {
        }

        // entry point, for all intents and purposes
        public void OnStartup(object sender, StartupEventArgs e)
        {
            Options = LaunchOptions.CreateFromArgs(e.Args);
            Log.Logger = new LoggerConfiguration()
                .WriteTo.Console()
                .WriteTo.File("log.txt", rollingInterval: RollingInterval.Day)
                .CreateLogger();


            IConfigurationBuilder config_builder = new ConfigurationBuilder()
                            .SetBasePath(AppContext.BaseDirectory)
                            .AddJsonFile("project.json")
                            .AddJsonFile("user.json");

            IConfiguration config = config_builder.Build();
            config["test"] = "123";

            IServiceCollection services = new ServiceCollection()
                //.AddLogging(builder => builder.AddSerilog(dispose))
                .AddSingleton(config)
                .AddSingleton(new MainWindow());
            //.AddOptions()
            //.AddLogging()

            ServiceProvider = services.BuildServiceProvider();
        }
    }
}
