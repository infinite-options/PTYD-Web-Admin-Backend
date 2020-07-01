using InfiniteMeals.Meals.Model;
using PrepToYourDoor.Model.Database;
using System;
using System.Collections.ObjectModel;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;



namespace InfiniteMeals {
    public partial class App : Application {

        static UserLoginDatabase database;
        static Boolean loggedIn = false;
        

        
        public App() {
            InitializeComponent();
 
            
            MainPage = new NavigationPage(new MainPage());
            //MainPage = new MainPage() { BindingContext = new MainPageViewModel() };
        }

        protected override void OnStart() {
        }

        protected override void OnSleep() {
        }

        protected override void OnResume() {
        }

        public static UserLoginDatabase Database {
            get {
                if(database == null) {
                    database = new UserLoginDatabase();
                }
                return database;
            }
        }

        /*
        public static Boolean LoggedIn {
            get {
                return loggedIn;
            }
        } */
    }
}
