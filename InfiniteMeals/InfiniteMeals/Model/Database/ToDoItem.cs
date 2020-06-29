using System;
using System.Collections.Generic;
using System.Text;
using SQLite;

namespace PrepToYourDoor.Model.Database {
    public class ToDoItem {

        [PrimaryKey, AutoIncrement]
        public int ID { get; set; }



        public override string ToString() {
            return "this works omg " + this.ID;
        }
    }
}
