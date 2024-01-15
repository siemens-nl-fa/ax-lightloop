USING System.Timer;
CLASS Trafficlight IMPLEMENTS ITrafficlight
    VAR
        //Initialize Led classes
        Red : Led;
        Yellow : Led;
        Green : Led;

        IdleMode: BOOL := false; //Init IdleMode to false
        state : INT;

        //Set the time that the light should be on
        YellowTime : TIME := TIME#1s;
        RedTime : TIME := TIME#1s;
        GreenTime : TIME := TIME#1s;

        Timer : System.Timer.OnDelay;
    END_VAR



    METHOD PUBLIC Cycle 
        VAR_INPUT
            
        END_VAR
        CASE State OF
            0:
                //Blink the yellow light if idlemode is active
                IF IdleMode THEN   
                THIS.Flash();
                ELSE
                    Yellow.TurnOff();
                    State := 1;
                END_IF;                
            1:
                //Red
                
                Timer(signal := NOT Timer.output, duration := RedTime);
                IF Timer.output THEN
                    Red.TurnOff();
                    Green.TurnOn();
                    State := 2;  
                END_IF;          
            2:
                //Green
                
                Timer(signal := NOT Timer.output, duration := GreenTime);
                IF Timer.output THEN
                    Green.TurnOff();
                    Yellow.TurnOn();
                    State := 3;  
                END_IF;
            3:
                //Yellow
                
                Timer(signal := NOT Timer.output, duration := YellowTime);   
                IF Timer.output THEN
                    Yellow.TurnOff();
                    Red.TurnOn();
                    State := 1;  
                END_IF;
        END_CASE;
        ;
    END_METHOD

    //Get the state of the invidual LED's
    METHOD PUBLIC GetLedEquipmentState
        VAR_OUTPUT
            redHw :BOOL;
            yellowHw :BOOL;
            greenHw :BOOL;
        END_VAR;
        redHw := Red.GetState();
        yellowHw := Yellow.GetState();
        greenHw := Green.GetState();
    END_METHOD

    //Set Time for yellow light
    METHOD PUBLIC setTimeYellow
        VAR_INPUT
            DelayTime : TIME;
        END_VAR
        YellowTime := DelayTime;
        ;
    END_METHOD

    METHOD PUBLIC Go : BOOL
        //transition from red to green
        IF Red.GetState() AND Yellow.GetState() = FALSE OR IdleMode THEN
            IdleMode := FALSE;
            Red.TurnOff();
            Yellow.TurnOff();
            Green.TurnOn();
            Go := TRUE;
        // ELSIF Green.GetState() = FALSE THEN
        //     THIS.SetIdleMode(true);
        END_IF;
        ;
    END_METHOD

    METHOD PUBLIC Stop :BOOL

        IF Green.GetState() AND Yellow.GetState() = FALSE OR IdleMode OR Yellow.GetState() THEN
            Yellow.TurnOn();
            Green.TurnOff();
                Timer(signal := NOT Timer.output, duration := YellowTime);               
                IF Timer.output THEN  
                    // Code to turn on the light
                    IdleMode := FALSE;
                    Red.TurnOn();
                    Yellow.TurnOff();
                    Stop := TRUE;
                    ;
                END_IF;
        // ELSIF Red.GetState() = false THEN
        //     THIS.SetIdleMode(true);
        END_IF;

    
    END_METHOD

    METHOD PUBLIC SetIdleMode
        VAR_INPUT
            Set : BOOL;
        END_VAR
        IdleMode := Set;
        ;
    END_METHOD

    METHOD PUBLIC Flash
             
        //todo this should start flashing
        Timer(signal := NOT Timer.output, duration := TIME#1s);
        IF Timer.output THEN  
            // Code to turn on the light
            Red.TurnOff();
            Yellow.TurnOn();
            Green.TurnOff(); 
            ;
        ELSE  
            // Code to turn off the light 
            Red.TurnOff();
            Yellow.TurnOff();
            Green.TurnOff();
            ;
        END_IF;  
        ;

    END_METHOD
END_CLASS
