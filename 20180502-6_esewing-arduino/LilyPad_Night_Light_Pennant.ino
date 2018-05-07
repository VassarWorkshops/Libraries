/******************************************************************
--LilyPad Light Sensor Trigger - Automatic Night Light
--By KOOKYE
This example code reads the input from a LilyPad Light Sensor compares it to
a set threshold named 'dark'. If the light reading is below the threshold,
three LEDs will turn on and a tri-color led will change the color. 

Light Sensor connections:
   * S pin to A3
   * + pin to A5
   * - to -

Tri-color LED connections:
   * R pin to 11
   * B pin to 10
   * G Pin to 9
   * + Pin to 3
 
Connect an LED to pin 2
********************************************************************/
// The dark variable determines when we turn the LEDs on or off. 
// Set higher or lower to adjust sensitivity.
const int darkLevel = 50;

// Create a variable to hold the readings from the light sensor.
int lightValue;

// Set which pin the Signal output from the light sensor is connected to
// If using the LilyPad Development Board, change this to A6
int sensorPin = A3;

// Set which pin the LED is connected to. 
int led = 2;
int RGBled = 3;

void setup()
{
   // Set pin 3 to use as a power pin for the RGB led
   pinMode(3, OUTPUT);   
   digitalWrite(3, HIGH); 
   
   // Set sensorPin as an INPUT 
   pinMode(sensorPin, INPUT);

   // Set LED as outputs
   pinMode(led, OUTPUT);

   // Set pin 9 as outputs, turn on and turn off the green led 
   pinMode(9, OUTPUT);      
   digitalWrite(9, LOW);     
   delay(500);              
   digitalWrite(9, HIGH);   
   
   // Set pin 10 as outputs, turn on and turn off the blue led 
   pinMode(10, OUTPUT);     
   digitalWrite(10, LOW);   
   delay(500);              
   digitalWrite(10, HIGH);  

   // Set pin 11 as outputs, turn on and turn off the red led 
   pinMode(11, OUTPUT);     
   digitalWrite(11, LOW);  
   delay(500);              
   digitalWrite(11, HIGH);  

   // Set pin A5 to use as a power pin for the light sensor
   pinMode(A5, OUTPUT);
   digitalWrite(A5, HIGH); 

  // Initialize Serial, set the baud rate to 9600 bps.
   Serial.begin(9600);  
}

void loop()
{
    // Read the light sensor's value and store in 'lightValue'
    lightValue = analogRead(sensorPin);

    // Print some descriptive text and then the value from the sensor
    Serial.print("Light value is:");
    Serial.println(lightValue);

    // Compare "lightValue" to the "dark" variable
    if (lightValue <= darkLevel) // If the reading is less then 'darkLevel'
    {
        digitalWrite(led, HIGH); // Turn on green led 
        digitalWrite(9, LOW);
        digitalWrite(10,HIGH);
        digitalWrite(11, HIGH);
    }
    else // Otherwise, if "lightValue" is greater than "dark"
    {
        digitalWrite(led, LOW);  // Turn on red led
        digitalWrite(9, HIGH);
        digitalWrite(10, LOW);
        digitalWrite(11, HIGH);
    }

    // Delay so that the text doesn't scroll to fast on the Serial Monitor. 
    // Adjust to a larger number for a slower scroll.
    delay(100);
}

