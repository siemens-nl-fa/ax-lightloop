CONFIGURATION PLC_1
    TASK Main(Interval := T#10ms, Priority := 1);
    PROGRAM P1 WITH Main: StatusLedCtrl;

    VAR_GLOBAL
        RedLed AT %Q0.0 : BOOL;
        YellowLed AT %Q0.1 : BOOL;
        GreenLed AT %Q0.3 : BOOL;
        trafficlight : Trafficlight;
        idle: BOOL;
        Stop: BOOL;
        Go: BOOL;
        State: int;
    END_VAR
END_CONFIGURATION
