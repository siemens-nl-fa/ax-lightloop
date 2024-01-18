CONFIGURATION PLC_1
    TASK Main(Interval := T#10ms, Priority := 1);
    PROGRAM P1 WITH Main: StatusLedCtrl;

    VAR_GLOBAL
        //Map LED's to HW output
        LedHw AT %IB0 : LedHw;
        //Init Trafficlight
        trafficlight : Trafficlight;
        //Some Bools to control
        idle: BOOL;
    END_VAR
END_CONFIGURATION
