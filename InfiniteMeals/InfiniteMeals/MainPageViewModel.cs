using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Amazon.DynamoDBv2.Model;

namespace InfiniteMeals
{
    public class MainPageViewModel : GalaSoft.MvvmLight.ViewModelBase
    {
        public MainPageViewModel()
        {
            FetchData();
        }

        public IEnumerable<object> Data { private set; get; }

        private async Task FetchData()
        {
            var credentials = new Amazon.CognitoIdentity.CognitoAWSCredentials(
            AWSEnvironment.IdentityPoolId,
            Amazon.RegionEndpoint.USWest1);

            var ddbClient = new Amazon.DynamoDBv2.AmazonDynamoDBClient(credentials, Amazon.RegionEndpoint.USWest1);

            var result = await ddbClient.ScanAsync(new ScanRequest
            {
                TableName="ptyd_menu",
                AttributesToGet= new List<string> { "meal_name" }
            });

            Data = result.Items.Select(i => new
            {
                meal_name = i["meal_name"].S
            }).OrderBy(i => i.meal_name);

            RaisePropertyChanged(nameof(Data));
        }
    }
}
