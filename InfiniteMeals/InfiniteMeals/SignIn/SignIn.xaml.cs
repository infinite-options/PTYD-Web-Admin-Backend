using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using System.Globalization;

namespace InfiniteMeals.SignIn
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class SignIn : ContentPage
    {

        ObservableCollection<User.User> Users = new ObservableCollection<User.User>();

        public SignIn()
        {
            InitializeComponent();

        }

        private async void ClickedMealSchedule(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Meals.MealSchedule());
        }

        private async void ClickedUserProfile(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Profile.UserProfile());
        }

        private async void ClickedSubscribe(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Subscribe.Subscribe());
        }

        void ClickedLogin(object sender, EventArgs e)
        {
            User.User user = new User.User(Username.Text, Password.Text);
        }

    }
}