using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using SQLite;

namespace InfiniteMeals.Model.Database {

    // database constants for when the database is created
    public static class DatabaseConstants {
        public const string DatabaseFilename = "PTYD_DB.db3";

        public const SQLite.SQLiteOpenFlags flags =
            SQLite.SQLiteOpenFlags.ReadWrite | // open database in read/write
            SQLite.SQLiteOpenFlags.Create | // create database if it doesn't exist
            SQLite.SQLiteOpenFlags.SharedCache; //multi-threaded database access

        // place database in the phone's local folder
        public static string DatabasePath {
            get {
                var basePath = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
                return Path.Combine(basePath, DatabaseFilename);
            }
        }

    }
}
