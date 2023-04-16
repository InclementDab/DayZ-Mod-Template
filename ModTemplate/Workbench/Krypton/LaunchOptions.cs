using CommandLine;

using Microsoft.Win32;

// we dont give a fuck about linux
#pragma warning disable CA1416

namespace Krypton
{
    internal class LaunchOptions
    {
        [Option('v', "verbose", HelpText = "See verbose output")]
        public bool Verbose { get; set; } = true;

        [Option("gamedir", HelpText = "Current Game Directory")]
        public string? GameDirectory { get; set; }

        [Option("serverdir", HelpText = "Current Server Directory")]
        public string? ServerDirectory { get; set; }

        public object? PboProjectDirectory => Registry.CurrentUser.GetValue("Software\\Mikero\\pboProject");


        internal static LaunchOptions Create(string[] args)
        {
            return Parser.Default.ParseArguments<LaunchOptions>(args)
                .WithParsed<LaunchOptions>(o => {
                    if (o.Verbose) {
                        Console.WriteLine($"Verbose output enabled");
                    }
                }).Value;
        }
    }
}