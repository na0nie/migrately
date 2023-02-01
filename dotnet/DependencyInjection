    public class DependencyInjection
    {
        public static void ConfigureServices(IServiceCollection services, IConfiguration configuration)
        {
            if (configuration is IConfigurationRoot)
            {
                services.AddSingleton<IConfigurationRoot>(configuration as IConfigurationRoot); 
            }

            services.AddSingleton<IConfiguration>(configuration); 

            string connString = configuration.GetConnectionString("Default");

            services.AddSingleton<IAuthenticationService<int>, WebAuthenticationService>();

            services.AddSingleton<Sabio.Data.Providers.IDataProvider, SqlDataProvider>(delegate (IServiceProvider provider)
            {
                return new SqlDataProvider(connString);
            }
            );

            services.AddSingleton<IAttorneyService, AttorneyService>();
   

            GetAllEntities().ForEach(tt =>
            {
                IConfigureDependencyInjection idi = Activator.CreateInstance(tt) as IConfigureDependencyInjection;

                idi.ConfigureServices(services, configuration);
            });
        }
