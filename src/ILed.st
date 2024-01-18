/// Iled interface, every LED class should atleast have these functions
INTERFACE ILed 
    /// GetState
    /// Method to get the state
    /// Return value: BOOL
    METHOD GetState : BOOL        
    END_METHOD
    /// TurnOn
    /// Method to turn ON the LED
    /// Return value: BOOL
    METHOD TurnOn        
    END_METHOD
    /// TurnOff
    /// Method to turn OFF the LED
    /// Return value: BOOL
    METHOD TurnOff       
    END_METHOD

END_INTERFACE