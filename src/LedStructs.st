
TYPE
    ///LedHw relative struct for IO assignment
    LedHw : STRUCT
        Red AT %X0.0 : BOOL;
        Yellow AT %X0.1 : BOOL;
        Green AT %X0.2 : BOOL;
    END_STRUCT;
END_TYPE

TYPE
    ///Leds array for passing bools
    Leds : STRUCT
        Red  : BOOL;
        Yellow  : BOOL;
        Green  : BOOL;
    END_STRUCT;
END_TYPE