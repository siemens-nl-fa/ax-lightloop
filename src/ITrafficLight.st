INTERFACE ITrafficlight //ITrafficlight interfaces defines the minimum requirements for a lightstack

    /// GetState
    /// Method to get the current state of the TrafficLight
    /// Return value: state int
    METHOD GetState : int
    END_METHOD
    /// GetLedEquipmentState
    /// Method to get the current state of the Led's
    /// Return value: redHw :BOOL; yellowHw :BOOL; greenHw :BOOL;
    METHOD GetLedEquipmentState
        VAR_OUTPUT
            Leds: leds;
        END_VAR
        END_METHOD
    /// Go
    /// Method set the current state of the TrafficLight to Go
    /// Return value: success bool
    METHOD Go : BOOL  
    END_METHOD
    /// Stop
    /// Method set the current state of the TrafficLight to Stop
    /// Return value: success bool
    METHOD Stop : BOOL   
    END_METHOD
    /// Flash
    /// Method set the current state of the TrafficLight to Flash for idlemode
    /// Return value: none
    METHOD Flash        
    END_METHOD
    /// Stop
    /// Method set the current state of the TrafficLight to Idle
    /// Return value: none
    METHOD  SetIdleMode
        VAR_INPUT
            Set : BOOL;
        END_VAR
    END_METHOD
END_INTERFACE