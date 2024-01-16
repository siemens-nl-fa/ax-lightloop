
PROGRAM StatusLedCtrl
    VAR_EXTERNAL
        RedLed  : BOOL;
        YellowLed  : BOOL;
        GreenLed : BOOL;
        trafficlight : Trafficlight;
        idle: BOOL;
        Stop: BOOL;
        Go: BOOL;
        State: int;
    END_VAR

    VAR
        
    END_VAR

    //Get the state of the traffic light
    trafficlight.GetLedEquipmentState(RedLed, YellowLed, GreenLed);

    //Execute the trafficlight statemachine
    trafficlight.Cycle();

    //Set the trafficlight to idle if idle bool is triggered
    trafficlight.SetIdleMode(idle);
    ;
END_PROGRAM
