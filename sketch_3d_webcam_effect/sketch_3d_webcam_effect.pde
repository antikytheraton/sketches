// Run this program only in the Java mode inside the IDE,
// not on Processing.js (web mode)!!

import processing.video.*;

Capture cam;

void setup() {
  println(Capture.list());
  size(1280, 720, P3D);
  //cam = new Capture(this, 1920, 1080, "Lenovo EasyCamera", 5);
  //cam = new Capture(this, 640, 480, "Lenovo EasyCamera", 30);
  cam = new Capture(this, 640, 480, 30);
  cam.start();
}

void draw() {
  background(0);
  if (cam.available()) {
    cam.read();
  }
  //image(cam, 0, -240, 640*2, 480*2);
  //set(0,0,cam);
  noStroke();
  for (int x = 0; x<width; x+=3) {
    for (int y = 0; y<height; y+=3) {
      fill( cam.get(x, y), 255);

      pushMatrix();
      translate(x*2, y*2 -240, brightness(cam.get(x, y)) );

      //ellipse(0, 0, brightness(cam.get(x, y)), brightness(cam.get(x, y)));
      //triangle(0, 0, 1, 1, 0, 1);
      rect(0, 0, 3, 3);
      popMatrix();
    }
  }
}