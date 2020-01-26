DROP TABLE IF EXISTS Skips;
CREATE TABLE IF NOT EXISTS Skips (
    Date_Submitted DATETIME NOT NULL,
    Phone_Number VARCHAR(10) NOT NULL,
    Skip_Sunday_Date DATE NOT NULL,
--  FOREIGN KEY (Date_Submitted) REFERENCES Orders(Date_Submitted),
--  FOREIGN KEY (Phone_Number) REFERENCES Orders(Phone_Number)
    FOREIGN KEY (Date_Submitted, Phone_Number) REFERENCES Orders(Date_Submitted, Phone_Number)
);
