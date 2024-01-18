
PROGRAM StatusLedCtrl
    VAR_EXTERNAL
        LedHW : LedHw;
        TrafficLight : Trafficlight;
        Idle: BOOL;
    END_VAR
    VAR
        SWLeds : leds;
    END_VAR


    //Get the state of the traffic light
    TrafficLight.GetLedEquipmentState(SwLeds);

    LedHW := SWLeds;

    //Execute the trafficlight statemachine
    TrafficLight.Cycle();

    //Set the trafficlight to idle if idle bool is triggered
    TrafficLight.SetIdleMode(Idle);
    ;
END_PROGRAM
