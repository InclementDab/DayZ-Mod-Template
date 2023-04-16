
namespace Krypton
{
    internal class App
    {

        public LaunchOptions Options { get; protected set; }

        internal App(LaunchOptions options)
        {
            Options = options;

            Console.WriteLine(Options.PboProjectDirectory);
        }

        protected static App? m_AppInstance;

        public static void Start(LaunchOptions options)
        {
            m_AppInstance = new App(options);
        }

        public static void Stop()
        {

        }
    }
}