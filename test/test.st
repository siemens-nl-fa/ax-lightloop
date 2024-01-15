USING AxUnit;

NAMESPACE MyTest

    {TestFixture}
    CLASS LEDTest
        VAR
            TestLed : Led;
        END_VAR
        {Test}
        METHOD PUBLIC LedTurnOn
            TestLed.TurnOn();
            Assert.Equal(actual := TestLed.GetState(), expected := TRUE);
        END_METHOD
        {Test}
        METHOD PUBLIC LedTurnOff
            TestLed.TurnOff();
            Assert.Equal(actual := TestLed.GetState(), expected := FALSE);
        END_METHOD

        {Test}
        METHOD PUBLIC Toggle
            TestLed.TurnOff();
            TestLed.Toggle();
            Assert.Equal(actual := TestLed.GetState(), expected := TRUE);
            TestLed.Toggle();
            Assert.Equal(actual := TestLed.GetState(), expected := FALSE);
        END_METHOD

    END_CLASS
    {TestFixture}
    CLASS TrafficLightTest
        VAR
            TestTrafficlight : Trafficlight;
        END_VAR
        {Test}
        METHOD PUBLIC TestGetEquipmentState
            VAR
                actualred : BOOL;
                actualyellow: BOOL;
                actualgreen: BOOL;
            END_VAR
            TestTrafficlight.GetLedEquipmentState(actualred, actualyellow, actualgreen);
            Assert.Equal(actualred, FALSE);
            Assert.Equal(actualyellow, FALSE);
            Assert.Equal(actualgreen, FALSE);         
        END_METHOD
        {Test}
        METHOD PUBLIC TestGo
            VAR
                actualred : BOOL;
                actualyellow: BOOL;
                actualgreen: BOOL;
            END_VAR
            TestTrafficlight.SetIdleMode(TRUE);
            TestTrafficlight.Go();
            TestTrafficlight.GetLedEquipmentState(actualred, actualyellow, actualgreen);
            Assert.Equal(actualred, FALSE);
            Assert.Equal(actualyellow, FALSE);
            Assert.Equal(actualgreen, TRUE);         
        END_METHOD
        {Test} //requires mocking for the timer
        METHOD PUBLIC TestStop
            VAR
                actualred : BOOL;
                actualyellow: BOOL;
                actualgreen: BOOL;
            END_VAR
            TestTrafficlight.SetIdleMode(TRUE);
            TestTrafficlight.Stop();
            TestTrafficlight.GetLedEquipmentState(actualred, actualyellow, actualgreen);
            Assert.Equal(actualred, FALSE);
            Assert.Equal(actualyellow, TRUE); // check for first state ( yellow := true)
            Assert.Equal(actualgreen, FALSE);         
        END_METHOD

    END_CLASS

END_NAMESPACE
