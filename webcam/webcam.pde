import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);

  String[] cameras = Capture.list();
    cam = new Capture(this, width, height);
    cam.start();  
    noStroke();
    smooth();
}

void draw() {
    background(255);
   for (int i = 0; i < 640; i = i+20) {
  for (int j = 0; j < 480; j = j+20) {
    fill(cam.get(i, j));
    rect(i, j, 15,15);
    
  }
}

  if (cam.available() == true) {
    cam.read();
  }
  //image(cam, 0,0);
}