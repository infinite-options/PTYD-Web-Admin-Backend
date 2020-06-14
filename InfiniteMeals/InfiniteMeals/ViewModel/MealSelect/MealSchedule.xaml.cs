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
using InfiniteMeals.Meals.Model;

namespace InfiniteMeals.Meals {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MealSchedule : ContentPage {
        int ctr = 2;
        bool disabled = false;
        List<String> order = new List<String>();

        public IList<Dates> SundayDates { get; private set; }
        public IList<Dates> MondayDates { get; private set; }

        String green = "#8FBC8F";
        String def = "#F5F5F5";

        public MealSchedule() {
            InitializeComponent();

            ToolbarItem totalBar = new ToolbarItem
            {
                Text = "Profile",
                IconImageSource = ImageSource.FromFile("oats.jpg"),
                Order = ToolbarItemOrder.Secondary,
                Priority = 0,
            };
            ToolbarItem totalBar2 = new ToolbarItem
            {
                Text = "Log Out",
                IconImageSource = ImageSource.FromFile("oats.jpg"),
                Order = ToolbarItemOrder.Secondary,
                Priority = 0,
            };
            this.ToolbarItems.Add(totalBar);
            this.ToolbarItems.Add(totalBar2);
            getData();
        }

        private async void getData()
        {
            List<String> sundaySched = new List<String>();
            List<String> mondaySched = new List<String>();
            SundayDates = new List<Dates>();
            MondayDates = new List<Dates>();

            HttpClient client = new HttpClient();
            var content = await client.GetStringAsync("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals");
            var obj = JsonConvert.DeserializeObject<Data>(content);

            sundaySched.Add(obj.Result.MenuForWeek1.Sunday);
            mondaySched.Add(obj.Result.MenuForWeek1.Monday);

            SundayDates.Add(new Dates
            {
               sundayDate = sundaySched[0].ToString(),
            });

            MondayDates.Add(new Dates
            {
                mondayDate = mondaySched[0].ToString(),
            });



                    // Here



            BindingContext = this;
        }

        private void ClickedColor(object sender, EventArgs e) {
            Button btn = (Button)sender;
            System.Diagnostics.Debug.WriteLine("Class ID" + btn.ClassId + "Disabled? " + disabled + " Ctr " + ctr);


            if (btn.ClassId == "SkipButton") {
                if (btn.BackgroundColor.Equals(Color.FromHex(green)))
                    {
                    btn.BackgroundColor = (Color.FromHex(def));
                    disabled = false;
                    ctr = 0;
                }
                else if (btn.BackgroundColor.Equals(Color.FromHex(def))) {
                    btn.BackgroundColor = Color.FromHex(green);
                    SundayButton.BackgroundColor = Color.FromHex(def);
                    MondayButton.BackgroundColor = Color.FromHex(def);
                    AddonButton.BackgroundColor = Color.FromHex(def);
                    SurpriseButton.BackgroundColor = Color.FromHex(def);
                    SelectButton.BackgroundColor = Color.FromHex(def);
                    disabled = true;
                    ctr = 2;
                }
            }
            else {
                if (disabled == true)
                {
                    if (btn.BackgroundColor.Equals(Color.FromHex(def)))
                    {
                        if (btn.ClassId.Equals("MonButton"))
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            SundayButton.BackgroundColor = Color.FromHex(def);
                            SkipButton.BackgroundColor = Color.FromHex(def);
                            disabled = false;
                        }
                        else if (btn.ClassId.Equals("SunButton"))
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            MondayButton.BackgroundColor = Color.FromHex(def);
                            SkipButton.BackgroundColor = Color.FromHex(def);
                            disabled = false;
                        }
                    }
                }
                else if (disabled == false)
                {
                    if (btn.BackgroundColor.Equals(Color.FromHex(def)))
                    {
                        if (btn.ClassId.Equals("MonButton"))
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            SundayButton.BackgroundColor = Color.FromHex(def);

                        }
                        else if (btn.ClassId.Equals("SunButton"))
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            MondayButton.BackgroundColor = Color.FromHex(def);
                        }

                        if (btn.ClassId.Equals("SelectButton"))
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            SurpriseButton.BackgroundColor = Color.FromHex(def);
                        }
                        else if (btn.ClassId.Equals("SurpriseButton"))
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            SelectButton.BackgroundColor = Color.FromHex(def);
                        }
                        else
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            order.Add(btn.Text);
                            ctr--;
                        }
                    }
                    else
                    {
                        btn.BackgroundColor = (Color.FromHex(def));
                        order.Remove(btn.Text);
                        ctr++;
                    }
                }
            }
        }

        private async void ClickedStepper(object sender, EventArgs e) {
            await Navigation.PushAsync(new Steppers.BasicSteppers());
        }

        private async void ClickedAddOn(object sender, EventArgs e)
        {
            // Change button colors

            Button btn = (Button)sender;

            if (btn.BackgroundColor.Equals(Color.FromHex(def)) &&
                SkipButton.BackgroundColor.Equals(Color.FromHex(def)))
            {
                btn.BackgroundColor = Color.FromHex("#F9E29C");
                await Navigation.PushAsync(new MealSelect.AddOnChoices());
                //await Navigation.PushAsync(new MealSelect.MealChoices());
            }
            else
            {
                btn.BackgroundColor = (Color.FromHex(def));
            }
        }

        private async void ClickedAddOnNav(object sender, EventArgs e)
        {
            ClickedAddOn(sender, e);
            await Navigation.PushAsync(new MealSelect.AddOnChoices());
        }

        private async void ClickedSelectMeal(object sender, EventArgs e)
        {
            ClickedColor(sender, e);
            if (SundayButton.BackgroundColor.Equals(Color.FromHex(green)) | MondayButton.BackgroundColor.Equals(Color.FromHex(green)))
                await Navigation.PushAsync(new MealSelect.MealChoices());
        }


    }
}