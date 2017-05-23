import processing.serial.*;

Serial myPort;

float heart;
float radius = 5.0;
int xPos = 1;
int screen_increment, old_x, old_y;
float inData;

void setup() {
  size(480, 480);

  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 115200);
  myPort.bufferUntil('\n');
  
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);

  // where we draw the heart shape  
  fill(250, 0, 0, 10);
  stroke(250, 0, 0, 10);
  strokeWeight(heart);          // make the heart big
  smooth();
  bezier(width/2, height*.3, width*.7, height*.9-height, width, height*.5, width/2, height*.7);
  bezier(width/2, height*.3, width*.3, height*.9-height, 0, height*.5, width/2, height*.7);
  strokeWeight(1);
  
  // and here we draw the beat signal
  fill(250);
  noStroke();
  ellipse(xPos, inData, radius, radius);


  if (xPos >= width) {
    xPos = 0;
    background(0);
  } else {
    xPos+=2;
  }
}