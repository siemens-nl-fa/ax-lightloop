CLASS Led IMPLEMENTS Iled //This Class implements the Iled interface, to make sure it complies
    
    
    VAR PRIVATE //Private VAR section, only accesible from inside this class
        IsOn : BOOL; //Private BOOl to keep track of the LED state
    END_VAR
    

    METHOD PUBLIC GetState : BOOL //Method to get the state
        GetState := IsOn; //Get the private state BOOL
        ;
    END_METHOD

    METHOD PUBLIC TurnOn //Method to turn ON the LED
        IsOn := TRUE; //Set the state to ON
        ;
    END_METHOD
    
    METHOD PUBLIC TurnOff //Method to turn OFF the LED
        IsOn := FALSE; //Set the state to OFF
        ;
    END_METHOD

    METHOD PUBLIC Toggle //Method to toggle the LED
        IF IsOn THEN //If the LED IsOn = true then set the LED to OFF
            IsOn := FALSE;
        ELSE
            IsOn := TRUE; //If the LED IsOn = false then set the LED to ON
        END_IF;
        ;       
    END_METHOD

END_CLASS