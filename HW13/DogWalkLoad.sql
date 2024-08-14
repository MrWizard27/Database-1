INSERT INTO Walkers (WalkerID, Fname, Lname, Phone, Balance, Percentage) VALUES (1, 'John', 'Doe', '123-456-7890', 10.00, 55.00);
INSERT INTO Walkers (WalkerID, Fname, Lname, Phone, Balance, Percentage) VALUES (2, 'Jane', 'Doe', '123-456-7891', 10.00, 30.00);
INSERT INTO Walkers (WalkerID, Fname, Lname, Phone, Balance, Percentage) VALUES (3, 'Sam', 'Smith', '123-456-7892', 10.00, 30.00);
INSERT INTO Walkers (WalkerID, Fname, Lname, Phone, Balance, Percentage) VALUES (4, 'Chris', 'Johnson', '123-456-7893', 10.00, 40.00);
INSERT INTO Walkers (WalkerID, Fname, Lname, Phone, Balance, Percentage) VALUES (5, 'Alex', 'Taylor', '123-456-7894', 20.00, 35.00);
COMMIT;

INSERT INTO Owners (OwnerID, Fname, Lname, Phone, Balance) VALUES (1, 'Michael', 'Scott', '321-654-9870', 100.00);
INSERT INTO Owners (OwnerID, Fname, Lname, Phone, Balance) VALUES (2, 'Pam', 'Beesly', '321-654-9871', 200.00);
INSERT INTO Owners (OwnerID, Fname, Lname, Phone, Balance) VALUES (3, 'Jim', 'Halpert', '321-654-9872', 300.00);
INSERT INTO Owners (OwnerID, Fname, Lname, Phone, Balance) VALUES (4, 'Dwight', 'Schrute', '321-654-9873', 400.00);
INSERT INTO Owners (OwnerID, Fname, Lname, Phone, Balance) VALUES (5, 'Angela', 'Martin', '321-654-9874', 100.00);
COMMIT;

INSERT INTO Dogs (DogID, DogName, Weight, Breed, OwnerID) VALUES (1, 'Buddy', 25.00, 'Beagle', 1);
INSERT INTO Dogs (DogID, DogName, Weight, Breed, OwnerID) VALUES (2, 'Max', 30.00, 'Bulldog', 2);
INSERT INTO Dogs (DogID, DogName, Weight, Breed, OwnerID) VALUES (3, 'Bella', 20.00, 'Poodle', 3);
INSERT INTO Dogs (DogID, DogName, Weight, Breed, OwnerID) VALUES (4, 'Lucy', 15.00, 'Chihuahua', 4);
INSERT INTO Dogs (DogID, DogName, Weight, Breed, OwnerID) VALUES (5, 'Daisy', 10.00, 'Pug', 5);
COMMIT;

INSERT INTO Rates (MinWeight, MaxWeight, Rate) VALUES (0, 15, 15.00);
INSERT INTO Rates (MinWeight, MaxWeight, Rate) VALUES (15, 25, 20.00);
INSERT INTO Rates (MinWeight, MaxWeight, Rate) VALUES (25, 35, 25.00);
INSERT INTO Rates (MinWeight, MaxWeight, Rate) VALUES (35, 45, 30.00);
INSERT INTO Rates (MinWeight, MaxWeight, Rate) VALUES (45, 999, 35.00);
COMMIT;

--Appt_no Begins at 1
INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 1, 1, TO_DATE('2023-12-01', 'YYYY-MM-DD'), 9, 25.00);

INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 2, 1, TO_DATE('2023-12-02', 'YYYY-MM-DD'), 10, 30.00);

INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 3, 2, TO_DATE('2023-12-03', 'YYYY-MM-DD'), 11, 20.00);

INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 4, 2, TO_DATE('2023-12-04', 'YYYY-MM-DD'), 12, 15.00);

INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 5, 3, TO_DATE('2023-12-05', 'YYYY-MM-DD'), 13, 35.00);

INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 1, 3, TO_DATE('2023-12-06', 'YYYY-MM-DD'), 14, 25.00);

INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 2, 4, TO_DATE('2023-12-07', 'YYYY-MM-DD'), 15, 30.00);

INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 3, 4, TO_DATE('2023-12-08', 'YYYY-MM-DD'), 16, 20.00);

INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 4, 5, TO_DATE('2023-12-09', 'YYYY-MM-DD'), 17, 15.00);

INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 5, 5, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 18, 35.00);

COMMIT;




