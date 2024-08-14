CREATE OR REPLACE PROCEDURE CancelAppointment(CAN_APPT IN NUMBER,OUTPUT OUT VARCHAR2)
AS
    appt_exists NUMBER(2);
    Day VARCHAR2(20);
    Hour VARCHAR2(5);
    CurrentDay VARCHAR2(20);
    CurrentHour VARCHAR2(5);
    cost NUMBER(20);
BEGIN
SELECT COUNT(*) INTO appt_exists FROM APPOINTMENTS WHERE APPT_NO = CAN_APPT;
--Checking to see if appointment exists
IF (appt_exists < 1) then
OUTPUT := (CAN_APPT || ' is not a valid appointment number');
ELSE
-------------------------------------------------------------------
SELECT APPT_DAY INTO Day FROM APPOINTMENTS WHERE APPT_NO = CAN_APPT;
SELECT APPT_HOUR INTO Hour FROM APPOINTMENTS WHERE APPT_NO = CAN_APPT;
SELECT TO_CHAR(SYSDATE, 'DD-MON-YY') INTO CurrentDay FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24') INTO CurrentHour FROM DUAL;
SELECT CHARGE into cost from appointments WHERE APPT_NO = CAN_APPT;

--checks if it's cancelabled
IF (Day = Currentday) AND (Hour - CurrentHour <= 0) then
OUTPUT := (CAN_APPT || ' is too late to cancel');
--cancels
ELSE
Delete from appointments Where appt_no = CAN_appt;
OUTPUT := ('Appointment number ' || CAN_APPT || ' was successfully deleted. $' || cost || ' should be refunded');
END IF;
END IF;
commit;
EXCEPTION
WHEN OTHERS THEN
      OUTPUT := ('Exception11: An error occurred on apartment:' || can_appt || 'exists:' || appt_exists || '... ' || SQLERRM);
      rollback;
END;
