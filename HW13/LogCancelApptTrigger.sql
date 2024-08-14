CREATE OR REPLACE TRIGGER LogCancelAppt
    BEFORE DELETE ON APPOINTMENTS
    FOR EACH ROW

BEGIN
INSERT INTO CancelApptLogs (APPT_NO, Cancel_TimeStamp, DogID, WalkerID, APPT_Day, APPT_Hour) 
VALUES (:old.APPT_NO, SYSTIMESTAMP, :old.DogID, :old.WalkerID, :old.APPT_Day, :old.APPT_Hour);
END;