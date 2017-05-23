import processing.serial.*;

Serial myPort;
int num = 300;
int y[] = new int[num];
int x[] = new int[num];
int xPos = 0;
int radius = 15;
float f;
float inByte;

void setup() {
  size(720, 480);
  smooth();
  noStroke();

  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 115200);
  myPort.bufferUntil('\n');
}

void draw() {
  frameRate(120);
  background(0);

  // copy array values from back to front
  for (int i = y.length-1; i > 0; i--) {
    y[i] = y[i-1];
    x[i] = x[i-1];
  }                
  x[0] = xPos;
  y[0] = int(inByte);

  for (int i = 0; i<y.length; i++) {
    f = map(i,0, y.length, 255, 0);
    fill(f);
    ellipse(x[i], y[i], radius, radius);
  }

  if (xPos >= width) {
    xPos = 0;
    background(0);
  } else {
    xPos+=1;
  }
}