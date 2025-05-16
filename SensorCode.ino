#include <Wire.h>
#include <WiFi.h>

#define AS5600_ADDRESS 0x36
#define RAW_ANGLE_ADDR 0x0C

const char* ssid = "ESP32_Pendulum";
const char* password = "password123";

//initialise global variables
float initialangle1 = 0;
float initialangle2 = 0;
WiFiServer server(12345);
//initialise time
unsigned long startTime = 0; 

void setup() {
    Serial.begin(115200);
    delay(1000);
    
    //Initialise WiFi Address
    Serial.println("Starting Access Point...");
    WiFi.softAP(ssid, password);
    
    Serial.print("AP IP Address: ");
    Serial.println(WiFi.softAPIP());
    Serial.println("TCP Server Starting...");
    
    server.begin();

    // Initialise I2C buses
    Wire.begin(21, 22);    //First sensor
    Wire1.begin(18, 19);   //Second sensor

    // Read initial angles
    uint16_t initialrawangle1 = readRawAngle(Wire);
    initialangle1 = initialrawangle1 * 360.0 / 4096.0;  
    
    uint16_t initialrawangle2 = readRawAngle(Wire1);
    initialangle2 = initialrawangle2 * 360.0 / 4096.0;

    Serial.print("Initial Angle 1 is: ");
    Serial.print(initialangle1);
    Serial.print(", Initial Angle 2 is: ");
    Serial.println(initialangle2);
    
    // Initialize the start time
    startTime = millis();
}

void loop() {
    WiFiClient client = server.available();
    
    if (client) {
        Serial.println("Client Connected!");
        
        // Reset the start time when a client connects
        startTime = millis();
        
        while (client.connected()) {
            //Check for tare angle command
            if (client.available() > 0) {
                String cmd = client.readStringUntil('\n');
                cmd.trim();
                if (cmd == "RESET") {
                    uint16_t raw1 = readRawAngle(Wire);
                    uint16_t raw2 = readRawAngle(Wire1);
                    //Converting from 12 bits to angle values
                    initialangle1 = raw1 * 360.0 / 4096.0;
                    initialangle2 = raw2 * 360.0 / 4096.0;
                    Serial.println("Angles reset to current position!");
                    
                   
                }
            }

            //get current time in seconds
            float currentTime = millis();
            float elapsedTime = (currentTime - startTime)/1000;

            //sensor reading and data sending
            uint16_t rawAngle1 = readRawAngle(Wire);
            uint16_t rawAngle2 = readRawAngle(Wire1);
            
            float angle1 = (rawAngle1 * 360.0 / 4096.0) - initialangle1;
            float angle2 = (rawAngle2 * 360.0 / 4096.0) - initialangle2;
            
           
            angle1 = fmod(angle1 + 180, 360) - 180;   
            angle2 = fmod(angle2 + 180, 360) - 180;
            
            //Send time and corresponding angle data
            client.print(elapsedTime);
            client.print(",");
            client.print(angle1);
            client.print(",");
            client.println(angle2);
            
            
            Serial.print("Time: ");
            Serial.print(elapsedTime);
            Serial.print("s, Angles: ");
            Serial.print(angle1);
            Serial.print(", ");
            Serial.println(angle2);
            
            //delay(20);
        }
        client.stop();
        Serial.println("Client Disconnected");
    }
}

uint16_t readRawAngle(TwoWire &wireInstance) {
    wireInstance.beginTransmission(AS5600_ADDRESS);
    wireInstance.write(RAW_ANGLE_ADDR);
    wireInstance.endTransmission();
    
    wireInstance.requestFrom(AS5600_ADDRESS, 2);
    if (wireInstance.available() >= 2) {
        uint8_t highByte = wireInstance.read();
        uint8_t lowByte = wireInstance.read();
        return ((highByte & 0x0F) << 8) | lowByte;
    }
    return 0;
}