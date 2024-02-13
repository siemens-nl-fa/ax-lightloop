
PROGRAM StatusLedCtrl
    VAR_EXTERNAL
        LedHW : LedHw;
        TrafficLight : Trafficlight;
        Idle: BOOL;
        count : INT;
    END_VAR
    VAR
        SWLeds : leds;
    END_VAR

    count := count+1;
    //Get the state of the traffic light
    TrafficLight.GetLedEquipmentState(SWLeds);

    LedHW.Green := SWLeds.Green;
    LedHW.Yellow := SWLeds.Yellow;
    LedHW.Red := SWLeds.Red;

    //Execute the trafficlight statemachine
    TrafficLight.Cycle();

    //Set the trafficlight to idle if idle bool is triggered
    TrafficLight.SetIdleMode(Idle);
    ;
END_PROGRAM
