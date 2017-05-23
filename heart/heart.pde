import processing.serial.*;

Serial myPort;

float heart;

void setup() {
  size(480, 480);

  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 115200);
  myPort.bufferUntil('\n');

}

void draw() {
  background(0);
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);
  
  fill(250, 0, 0);
  stroke(250, 0, 0);

  strokeWeight(heart);          // make the heart big

  // where we draw the heart shape
  smooth();
  bezier(width/2, height*.3, width*.7, height*.9-height, width, height*.5, width/2, height*.7);
  bezier(width/2, height*.3, width*.3, height*.9-height, 0, height*.5, width/2, height*.7);
  strokeWeight(1);
}