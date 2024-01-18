USING AxUnit;

NAMESPACE MyTest

    {TestFixture}
    /// LEDTest Class
    /// Here you'll find the LED object related tests
    /// Return value: Pass or Fail
    CLASS LEDTest
        VAR
            TestLed : Led;
        END_VAR

        {Test}
        /// LedTurnOn
        /// Test is the LED object actually turns on when the method TurnOff is called
        /// Return value: Pass or Fail
        METHOD PUBLIC LedTurnOn
            TestLed.TurnOn();
            Assert.Equal(actual := TestLed.GetState(), expected := TRUE);
        END_METHOD

        {Test}
        /// LedTurnOff
        /// Test is the LED object actually turns off when the method TurnOff is called
        /// Return value: Pass or Fail
        METHOD PUBLIC LedTurnOff
            TestLed.TurnOff();
            Assert.Equal(actual := TestLed.GetState(), expected := FALSE);
        END_METHOD

        {Test}
        /// Toggle
        /// Test is the LED object actually toggles when the method Toggle is called
        /// Return value: Pas Or Fail
        METHOD PUBLIC Toggle
            TestLed.TurnOff();
            TestLed.Toggle();
            Assert.Equal(actual := TestLed.GetState(), expected := TRUE);
            TestLed.Toggle();
            Assert.Equal(actual := TestLed.GetState(), expected := FALSE);
        END_METHOD

    END_CLASS

    {TestFixture}
    /// TrafficLightTest Class
    /// Here you'll find the trafficlight object related tests
    /// Return value: Pass or Fail
    CLASS TrafficLightTest
        VAR
            TestTrafficlight : Trafficlight;
        END_VAR
        {Test}
        METHOD PUBLIC TestGetEquipmentState
            VAR
                Leds :leds;
            END_VAR
            TestTrafficlight.GetLedEquipmentState(Leds);
            Assert.Equal(Leds.Red, FALSE);
            Assert.Equal(Leds.Yellow, FALSE);
            Assert.Equal(Leds.Green, FALSE);          
        END_METHOD

        {Test}
        /// TestGo
        /// Test is the Go command sets the green light to green while setting red and yellow to false
        /// Return value: Pass or Fail
        METHOD PUBLIC TestGo
            VAR
                Leds :leds;
            END_VAR
            TestTrafficlight.SetIdleMode(TRUE);
            TestTrafficlight.Go();
            TestTrafficlight.GetLedEquipmentState(Leds);
            Assert.Equal(Leds.Red, FALSE);
            Assert.Equal(Leds.Yellow, FALSE);
            Assert.Equal(Leds.Green, TRUE);         
        END_METHOD

        {Test} 
        /// TestStop
        /// Test is the traffic light will switch to yellow, then red ( RED not yet implemented because mocking is required for timer)
        /// Return value: Pass or Fail
        METHOD PUBLIC TestStop
            VAR
                Leds :leds;
            END_VAR
            TestTrafficlight.SetIdleMode(TRUE);
            TestTrafficlight.Stop();
            TestTrafficlight.GetLedEquipmentState(Leds);
            Assert.Equal(Leds.Red, FALSE);
            Assert.Equal(Leds.Yellow, TRUE);
            Assert.Equal(Leds.Green, FALSE);            
        END_METHOD

    END_CLASS

END_NAMESPACE
