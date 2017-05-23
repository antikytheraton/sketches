//******************************************************
//  importing libraries
import processing.serial.*;
//******************************************************

//******************************************************
//  declarating variables
Serial myPort;       // serial port

float radius = 5.0; // radius of the beat circle
int xPos = 1;        // horizontal position of the graph
float inByte;        // y position of the line and circle

//int screen_increment, old_x, old_y;
//******************************************************

void setup() {
  size(480, 480);
  background(0);
  //******************************************************
  //  serial communication
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 115200);

  myPort.bufferUntil('\n');
  //******************************************************

  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  fill(250, 28, 28);
  ellipse(xPos, inByte, radius, radius);

  // here we draw the beats line
  //line(old_x, old_y, screen_increment, inByte);

  if (xPos >= width) {
    xPos = 0;
    background(0);
  } else {
    xPos+=2;
  }
}