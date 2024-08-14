DROP TABLE Appointments;
DROP TABLE Dogs;
DROP TABLE Owners;
DROP TABLE Walkers;
DROP TABLE Rates;
DROP TABLE CancelApptLogs;
DROP SEQUENCE CancelApptLogsSeq;
DROP SEQUENCE Appt_Seq;

CREATE TABLE Walkers (
    WalkerID INTEGER PRIMARY KEY
,   Fname VARCHAR2(50) NOT NULL
,   Lname VARCHAR2(50) NOT NULL
,   Phone VARCHAR2(20) NOT NULL
,   Balance DECIMAL(10, 2) DEFAULT 0
,   Percentage DECIMAL(5, 2) DEFAULT 25.00
,   CONSTRAINT CHK_Walker_Balance CHECK (Balance >= 0)
,   CONSTRAINT CHK_Walker_Percentage CHECK (Percentage >= 0 AND Percentage <= 100)
);

CREATE TABLE Owners (
    OwnerID INTEGER PRIMARY KEY
,   Fname VARCHAR2(50) NOT NULL
,   Lname VARCHAR2(50) NOT NULL
,   Phone VARCHAR2(20) NOT NULL
,   Balance DECIMAL(10, 2) NOT NULL
,   CONSTRAINT CHK_Owner_Balance CHECK (Balance >= 0)
);


CREATE TABLE Dogs (
    DogID INTEGER PRIMARY KEY
,   DogName VARCHAR2(50) NOT NULL
,   Weight DECIMAL(5, 2) NOT NULL
,   Breed VARCHAR2(50) DEFAULT 'Mutt'
,   OwnerID INTEGER
,   FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID)
);



CREATE TABLE Rates ( 
    MinWeight INTEGER
,   MaxWeight INTEGER
,   Rate DECIMAL(5, 2) NOT NULL
,   PRIMARY KEY (MinWeight, MaxWeight)
);


--Appointment hour must be in 01 - 24 format
CREATE TABLE Appointments (
    Appt_No INTEGER PRIMARY KEY
,   DogID INTEGER
,   WalkerID INTEGER
,   Appt_Day DATE
,   Appt_Hour INTEGER
,   Charge DECIMAL(5, 2)  NOT NULL
,   FOREIGN KEY (WalkerID) REFERENCES Walkers(WalkerID)
,   FOREIGN KEY (DogID) REFERENCES Dogs(DogID)
,   CONSTRAINT UQ_Appointment_Time UNIQUE (WalkerID, Appt_Day, Appt_Hour)
,   CONSTRAINT CHK_Appt_Too_Late CHECK (Appt_Hour <= 20)
,   CONSTRAINT CHK_Appt_Too_Early CHECK (Appt_Hour >= 6)
--Used Too early/late chks so it's easier to understand what's wrong about time
);

CREATE SEQUENCE Appt_Seq
START WITH 1
INCREMENT BY 1;

COMMIT;
-- CREATE TABLE CancelApptLogs 
