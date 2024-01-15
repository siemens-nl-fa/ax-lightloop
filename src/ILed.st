INTERFACE ILed // Iled interface, every LED class should atleast have these functions
    METHOD GetState : BOOL        
    END_METHOD
    METHOD TurnOn        
    END_METHOD
    METHOD TurnOff       
    END_METHOD
    METHOD Toggle        
    END_METHOD
END_INTERFACE