using InfiniteMeals.Meals.Model;
using InfiniteMeals.Model.Database;
using System;
using System.Collections.ObjectModel;
using System.Runtime.CompilerServices;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;



namespace InfiniteMeals {
    public partial class App : Application {

        static UserLoginDatabase database;
        static Boolean loggedIn = false;



        public App() {
            InitializeComponent();
            
            if (database == null) {
                database = new UserLoginDatabase();
            }



            
            MainPage = new NavigationPage(new MainPage());

        }

        protected override void OnStart() {
        }

        protected override void OnSleep() {
        }

        protected override void OnResume() {
        }

        public static UserLoginDatabase Database {
            get {
                if (database == null) {
                    database = new UserLoginDatabase();
                }
                return database;
            }
        }


        public static Boolean LoggedIn {
            get {
                return loggedIn;
            }
        }
        
        public static void setLoggedIn(Boolean loggedIn) {
            App.loggedIn = loggedIn;
        }
    }
}
