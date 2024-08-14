INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 4, 4, TO_DATE('2023-12-06', 'YYYY-MM-DD'), 15, 35.00);
INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 2, 1, Sysdate, TO_CHAR(sysdate,'HH24'), 35.00);
INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 3, 5, Sysdate, 13, 30.00);
INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 1, 5, Sysdate, 14, 15.00);
INSERT INTO Appointments (Appt_No, DogID, WalkerID, Appt_Day, Appt_Hour, Charge)
VALUES (Appt_Seq.nextval, 5, 2, Sysdate, 15, 22.00);


SET SERVEROUTPUT ON;

DECLARE
    v_Message VARCHAR2(100);
BEGIN
--DBMS_OUTPUT.PUT_LINE('Attempt to delete');
    CancelAppointment(1, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
    CancelAppointment(2, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
    CancelAppointment(3, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
    CancelAppointment(4, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
    CancelAppointment(5, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
    CancelAppointment(6, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
    CancelAppointment(7, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
    CancelAppointment(8, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_sMessage);
    CancelAppointment(9, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
    CancelAppointment(10, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
    CancelAppointment(11, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
    CancelAppointment(12, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
    CancelAppointment(13, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
    CancelAppointment(14, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
    CancelAppointment(15, v_Message);
    DBMS_OUTPUT.PUT_LINE(v_Message);
END;
/
SELECT * FROM APPOINTMENTS;
SELECT * FROM CancelApptLogs;