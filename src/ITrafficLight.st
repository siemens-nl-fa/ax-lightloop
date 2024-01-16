INTERFACE ITrafficlight //ITrafficlight interfaces defines the minimum requirements for a lightstack
    METHOD GetLedEquipmentState
    VAR_OUTPUT
        redHw :BOOL;
        yellowHw :BOOL;
        greenHw :BOOL;
    END_VAR
    END_METHOD
     /// GetState
    /// Method to get the current state of the TrafficLight
    /// Return value: state int
    METHOD GetState : int
    END_METHOD
    METHOD Go : BOOL  
    END_METHOD
    METHOD Stop : BOOL   
    END_METHOD
    METHOD Flash        
    END_METHOD
    METHOD  SetIdleMode
        VAR_INPUT
            Set : BOOL;
        END_VAR
    END_METHOD
END_INTERFACE