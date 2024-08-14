DROP TABLE CancelApptLogs;
DROP SEQUENCE nu_seq;
CREATE SEQUENCE nu_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE TABLE CancelApptLogs(
    CancellationID NUMBER(20) DEFAULT nu_seq.NEXTVAL PRIMARY KEY,
    APPT_NO NUMBER(38,0),
    Cancel_TimeStamp DATE,
    DogID NUMBER(38,0),
    WalkerID NUMBER(38,0),
    APPT_Day DATE,
    APPT_Hour NUMBER(38,0)
    )