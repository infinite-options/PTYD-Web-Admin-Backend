using System;
using System.Collections.Generic;
using System.Net;
using Newtonsoft.Json;
using Xamarin.Forms;

namespace InfiniteMeals.ViewModel.Dbvm {
    public partial class Dbvm : ContentPage {
        public Dbvm() {
            string json = new WebClient().DownloadString("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals");
            var machine = JsonConvert.DeserializeObject<List<Model.Database.Test>>(json);
            Model.Database.Menu[] machines = JsonConvert.DeserializeObject<Model.Database.Menu[]>(json);
            foreach (var data in machines) {
                System.Diagnostics.Debug.WriteLine(data.MealName);
            }
        }
    }
}
