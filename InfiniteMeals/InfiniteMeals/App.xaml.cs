using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace InfiniteMeals {
    public partial class App : Application {
        public App() {
            InitializeComponent();

            MainPage = new NavigationPage(new Kitchens.Controller.MainPage());
            //MainPage = new MainPage() { BindingContext = new MainPageViewModel() };
        }

        protected override void OnStart() {
        }

        protected override void OnSleep() {
        }

        protected override void OnResume() {
        }
    }
}
