using CommandLine;
using System.Diagnostics;

using Microsoft.Win32;
using Microsoft.Extensions.Options;

// we dont give a fuck about linux
#pragma warning disable CA1416

namespace Krypton
{
    public class LaunchOptions
    {
        [Option('v', "verbose", HelpText = "See verbose output")]
        public bool Verbose { get; set; } = true;

        [Option("gamedir", HelpText = "Current Game Directory")]
        public string? GameDirectory { get; set; }

        [Option("serverdir", HelpText = "Current Server Directory")]
        public string? ServerDirectory { get; set; }

        public object? PboProjectDirectory => Registry.CurrentUser.GetValue("Software\\Mikero\\pboProject");


        public static LaunchOptions CreateFromArgs(string[] args)
        {
            return Parser.Default.ParseArguments<LaunchOptions>(args)
                .WithParsed<LaunchOptions>(o => {
                    if (o.Verbose) {
                        Debug.WriteLine($"Verbose output enabled");
                    }
                }).Value;
        }
    }
}
