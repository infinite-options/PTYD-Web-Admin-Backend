using InfiniteMeals.Model.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;



namespace InfiniteMeals.ViewModel.Profile
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class UserProfile : ContentPage
    {
        public UserProfile()
        {
            InitializeComponent();
        }

        private async void ChangePasswordClicked(object sender, EventArgs e) {
            UserLoginSession currentUserInfo = (UserLoginSession)this.BindingContext;
            ChangePasswordPage changePasswordPage = new ChangePasswordPage();
            changePasswordPage.BindingContext = currentUserInfo;
            await Navigation.PushAsync(changePasswordPage);
        }
    }
}