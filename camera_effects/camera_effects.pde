import processing.video.*;

Capture cam;

void setup() {
  //fullScreen();
  size(640, 480);

  String[] cameras = Capture.list();
  cam = new Capture(this, width, height);
  cam.start();
}

void draw() {
  background(0);
  for (int i = 0; i < width; i = i+20) {
    for (int j = 0; j < height; j = j+20) {
      fill(cam.get(i, j)*4);
      rect(i, j, 15, 15);
    }
  }

  if (cam.available() == true) {
    cam.read();
  }
  //image(cam, 0, 0);
}