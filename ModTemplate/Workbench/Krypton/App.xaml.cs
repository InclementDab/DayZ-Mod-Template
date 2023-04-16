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
    public class ProjectSettings
    {
        public string ModPrefix { get; set; } = "ModTemplate";
    }

    public partial class App : Application
    {
        public LaunchOptions? Options { get; private set; }

        public IServiceProvider ServiceProvider { get; private set; }

        public App()
        {
        }

        private void ConfigureServices(IServiceCollection services)
        {
            //.AddLogging(builder => builder.AddSerilog(dispose))
            //services.AddSingleton(config);
            services.AddTransient(typeof(ConfigurationWindow));
            //.AddOptions()
            //.AddLogging()
        }

        protected override void OnStartup(StartupEventArgs e)
        {
            Options = LaunchOptions.CreateFromArgs(e.Args);


            Log.Logger = new LoggerConfiguration()
                .WriteTo.Console()
                .WriteTo.File("log.txt", rollingInterval: RollingInterval.Day)
                .CreateLogger();

            IConfigurationBuilder config_builder = new ConfigurationBuilder()
                            .SetBasePath(AppContext.BaseDirectory)
                            .AddJsonFile("project.json", false, true)
                            .AddJsonFile("user.json", false, true);

            IConfiguration config = config_builder.Build();
            config["test"] = "123";

            IServiceCollection services = new ServiceCollection();
            ConfigureServices(services);
            ServiceProvider = services.BuildServiceProvider();

            ConfigurationWindow window = ServiceProvider.GetRequiredService<ConfigurationWindow>();
            window.Show();
        }
    }
}
