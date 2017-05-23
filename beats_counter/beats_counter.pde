import processing.serial.*;

Serial myPort;
PFont font;

float inByte;

void setup() {
  size(300, 120);
  smooth();
  font = loadFont("DejaVuSans-36.vlw");
  textFont(font);
  
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 115200);
  myPort.bufferUntil('\n');
}

void draw() {
  background(100);
  textSize(36);
  text(int(inByte), 25, 60);
}

void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  
  if (inString != null) {
    inString = trim(inString);
    inByte = float(inString);
  }
}