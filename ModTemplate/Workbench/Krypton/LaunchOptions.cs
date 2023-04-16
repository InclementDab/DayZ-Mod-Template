using CommandLine;

namespace Krypton
{
    internal class LaunchOptions
    {
        [Option('v', "verbose", HelpText = "See verbose output")]
        public bool Verbose { get; set; }

        [Option("gamedir", Required = true, HelpText = "Current Game Directory")]
        public string? GameDirectory { get; set; }

        static LaunchOptions Create(string[] args)
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