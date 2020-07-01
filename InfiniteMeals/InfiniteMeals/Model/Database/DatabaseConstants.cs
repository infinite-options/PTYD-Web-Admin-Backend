using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using SQLite;

namespace PrepToYourDoor.Model.Database {
    public static class DatabaseConstants {
        public const string DatabaseFilename = "PTYD_DB.db3";

        public const SQLite.SQLiteOpenFlags flags =
            SQLite.SQLiteOpenFlags.ReadWrite | // open database in read/write
            SQLite.SQLiteOpenFlags.Create | // create database if it doesn't exist
            SQLite.SQLiteOpenFlags.SharedCache; //multi-threaded database access

        public static string DatabasePath {
            get {
                var basePath = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
                return Path.Combine(basePath, DatabaseFilename);
            }
        }

    }
}
