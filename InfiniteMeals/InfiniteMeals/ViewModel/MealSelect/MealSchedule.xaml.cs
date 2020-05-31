using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Model.Database;

namespace InfiniteMeals.Meals {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MealSchedule : ContentPage {
        int ctr = 2;
        bool disabled = false;
        List<String> order = new List<String>();

        String green = "#8FBC8F";

        public MealSchedule() {
            InitializeComponent();
        }

        private async void ClickedSelectMeal(object sender, EventArgs e) {
            if (ctr == 2 | disabled == true)
                await Navigation.PushAsync(new MealSelect.MealChoices());
            else {
                // Toast to user
            }
        }

        private void ClickedColor(object sender, EventArgs e) {
            Button btn = (Button)sender;
            System.Diagnostics.Debug.WriteLine(btn.ClassId + " hi " + disabled);
            // Change button colors
            if (btn.ClassId == "SkipButton") {
                if (btn.BackgroundColor.Equals(Color.FromHex(green))) {
                    btn.BackgroundColor = Color.Default;
                    disabled = false;
                    ctr = 0;
                }
                else if (btn.BackgroundColor.Equals(Color.Default)) {
                    btn.BackgroundColor = Color.FromHex(green);

                    disabled = true;
                    ctr = 2;
                }
            }
            else {
                if (disabled == false) {
                    if (btn.BackgroundColor.Equals(Color.Default)) {
                        if (ctr < 2) {
                            btn.BackgroundColor = Color.FromHex(green);
                            order.Add(btn.Text);
                            ctr++;
                        }
                    }
                    else {
                        btn.BackgroundColor = Color.Default;
                        order.Remove(btn.Text);
                        ctr--;
                    }
                }
            }

            System.Diagnostics.Debug.WriteLine(btn.ClassId + " bye " + disabled);
        }

        private void ClickedAddOn(object sender, EventArgs e) {
            // Change button colors

            Button btn = (Button)sender;

            if (btn.BackgroundColor.Equals(Color.Default)) {
                btn.BackgroundColor = Color.FromHex("#F9E29C");
            }
            else {
                btn.BackgroundColor = Color.Default;
            }
        }

        private async void ClickedStepper(object sender, EventArgs e) {
            await Navigation.PushAsync(new Steppers.BasicSteppers());
        }

    }
}