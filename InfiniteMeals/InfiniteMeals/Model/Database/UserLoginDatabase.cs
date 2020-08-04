using InfiniteMeals;
using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace InfiniteMeals.Model.Database {

    // creates the database and contains methods for using database
    public class UserLoginDatabase {
        static readonly Lazy<SQLiteAsyncConnection> lazyInitializer = new Lazy<SQLiteAsyncConnection>(() => {
            return new SQLiteAsyncConnection(DatabaseConstants.DatabasePath, DatabaseConstants.flags);
        });

        static SQLiteAsyncConnection Database => lazyInitializer.Value;
        static bool initialized = false;

        public UserLoginDatabase() {
            InitializeAsync().SafeFireAndForget(false);
        }

        async Task InitializeAsync() {
            if(!initialized) {
                foreach(TableMapping tm in Database.TableMappings.ToList()) {
                }
                if(!Database.TableMappings.Any(m => m.MappedType.Name == typeof(UserLoginSession).Name)) {
                    await Database.CreateTablesAsync(CreateFlags.None, typeof(UserLoginSession)).ConfigureAwait(false);
                    initialized = true;
                }
            }
        }

        // gets all the items in the database
        public Task<List<UserLoginSession>> GetItemsAsync() { 
            return Database.Table<UserLoginSession>().ToListAsync();
        }

        // gets all the items that are not done in the database
        public Task<List<UserLoginSession>> GetItemsNotDoneAsync() {
            return Database.QueryAsync<UserLoginSession>("SELECT * FROM [UserLoginSession] WHERE [Done] = 0");
        }

        // gets an item based on id
        public Task<UserLoginSession> GetItemAsync(int id) {
            return Database.Table<UserLoginSession>().Where(i => i.ID == id).FirstOrDefaultAsync();
        }

        // posts an item to the database
        public Task<int> SaveItemAsync(UserLoginSession item) {
            if (item.ID != 0) {
                return Database.UpdateAsync(item);
            } else { 
                return Database.InsertAsync(item);
            }
        }

        // deletes an item from the database
        public Task<int> DeleteItemAsync(UserLoginSession item) {
            return Database.DeleteAsync(item);
        }

        // gets the most recent item from the database
        // this would be the user's current session 
        public UserLoginSession GetLastItem() {
            return Database.Table<UserLoginSession>().ToListAsync().Result.Last<UserLoginSession>();
            
        }



       
    }
}
