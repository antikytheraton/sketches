import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);

  String[] cameras = Capture.list();
  cam = new Capture(this, width, height);
  cam.start();
}
color pix;
int ssize = 20;
void draw() 
{
  for(int x=0; x<width; x+=ssize){
    for(int y=0; y<height; y+=ssize){
      pix = cam.get(x,y);
      fill(pix, 255);
      noStroke();
      smooth();
      ellipseMode(CORNER);
      ellipse(x, y, ssize,ssize);
    }
  }

  if (cam.available() == true) {
    cam.read();
  }
  //image(cam, 0,0);
}