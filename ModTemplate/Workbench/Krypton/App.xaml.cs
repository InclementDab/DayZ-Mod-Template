using System.Windows;
using System.Diagnostics;


using Microsoft.Extensions.DependencyInjection;


using Serilog;
using Microsoft.Extensions.Configuration;

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
            Log.Logger = new LoggerConfiguration()
                .WriteTo.Console()
                .WriteTo.RollingFile(@"logs\Log-{Date}.log")
                .MinimumLevel.Verbose()
                .CreateLogger();

            Log.Debug("Running app");
        }

        protected override void OnStartup(StartupEventArgs e)
        {
            Options = LaunchOptions.CreateFromArgs(e.Args);

            IConfigurationBuilder config_builder = new ConfigurationBuilder()
                            .SetBasePath(AppContext.BaseDirectory)
                            .AddJsonFile("project.json", false, true)
                            .AddJsonFile("user.json", false, true);

            IConfiguration config = config_builder.Build();
            config["test"] = "123";

            IServiceCollection services = new ServiceCollection()
                .AddSingleton(config)
                .AddTransient(typeof(ConfigurationWindow));
            ServiceProvider = services.BuildServiceProvider();

            ConfigurationWindow window = ServiceProvider.GetRequiredService<ConfigurationWindow>();
            window.Show();


        }
    }
}
