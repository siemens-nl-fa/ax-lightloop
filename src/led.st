CLASS Led IMPLEMENTS Iled //This Class implements the Iled interface, to make sure it complies
    VAR PRIVATE //Private VAR section, only accesible from inside this class
        IsOn : BOOL; //Private BOOl to keep track of the LED state
    END_VAR
    ///This overwrites the comment defined in the interface
    METHOD PUBLIC GetState : BOOL 
        GetState := IsOn; //Get the private state BOOL
        ;
    END_METHOD

    METHOD PUBLIC TurnOn 
        IsOn := TRUE; //Set the state to ON
        ;
    END_METHOD

    METHOD PUBLIC TurnOff 
        IsOn := FALSE; //Set the state to OFF
        ;
    END_METHOD

    /// Toggle
    /// This Method will Toggle the LED, this is not defined in the interface
    /// Return value: BOOL
    METHOD PUBLIC Toggle 
        IF IsOn THEN //If the LED IsOn = true then set the LED to OFF
            IsOn := FALSE;
        ELSE
            IsOn := TRUE; //If the LED IsOn = false then set the LED to ON
        END_IF;
        ;       
    END_METHOD

END_CLASS