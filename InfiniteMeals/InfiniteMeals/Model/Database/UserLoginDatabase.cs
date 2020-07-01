using InfiniteMeals;
using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace PrepToYourDoor.Model.Database {
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

        public Task<List<UserLoginSession>> GetItemsAsync() { 
            return Database.Table<UserLoginSession>().ToListAsync();
        }

        public Task<List<UserLoginSession>> GetItemsNotDoneAsync() {
            return Database.QueryAsync<UserLoginSession>("SELECT * FROM [UserLoginSession] WHERE [Done] = 0");
        }

        public Task<UserLoginSession> GetItemAsync(int id) {
            return Database.Table<UserLoginSession>().Where(i => i.ID == id).FirstOrDefaultAsync();
        }

        public Task<int> SaveItemAsync(UserLoginSession item) {
            if (item.ID != 0) {
                return Database.UpdateAsync(item);
            } else { 
                return Database.InsertAsync(item);
            }
        }

        public Task<int> DeleteItemAsync(UserLoginSession item) {
            return Database.DeleteAsync(item);
        }



       
    }
}
