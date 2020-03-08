import React from 'react';
import MaterialTable from 'material-table';



class MenuCreation extends React.Component{
    state = {
             MealName1: "Meal Name",
             MealName2: "cake",
        
             columns: [
               { title: "Subscription", field: "name" },
               { title: "Meal Name", field: "surname" },
               { title: "Qty", field: "birthYear", type: "numeric" }
               // {
               //   title: "Birth Place",
               //   field: "birthCity",
               //   lookup: { 34: "İstanbul", 63: "Şanlıurfa" }
               // }
             ],
             data: [
               { name: "Wkly Spcl 1", surname: "	Tomato", birthYear: 1 },
        
               {
                 name: "Wkly Spcl 2",
                 surname: "cake",
                 birthYear: 2
               }
             ]
           };
}

export default MenuCreation;