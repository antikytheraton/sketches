//step #1, import library
import processing.video.*;

//step #2, make a variable that holds web cam
Capture cam;

float [] xvals = new float[220];

float [] yvals = new float[220];

float [] xspeed = new float[220];

float [] yspeed = new float[220];

float [] speedThreshold = new float[220];

float [] boxSizes = new float[220];

void setup() {

  size(1280, 720);
  //get names and info of cameras available to computer
  String[] cameras = Capture.list();

  //set the variable
  cam = new Capture(this, cameras[0]);

  //start the camera
  cam.start();

  for (int i = 0; i < boxSizes.length; i ++ ) {

    boxSizes[i] = random(4, 12); 

    xvals[i] = width/2;

    yvals[i] = height/2;
  }

  background(0);
}

void draw() {

  if (cam.available() == true) {

    //reading new camera image
    cam.read();

    //loading my camera pixels
    cam.loadPixels();

    for (int i = 0; i<xvals.length; i++ ) {

      if (yvals[i]<0) {

        yvals[i]=0;
      }

      int arrayLoc = int(xvals[i]) + (int(yvals[i])*cam.width);

      if (arrayLoc > cam.pixels.length-1) {

        arrayLoc = cam.pixels.length-1;
      }

      //convert pixel info to r,g,b values
      float r = red(cam.pixels[arrayLoc]);

      float g = green(cam.pixels[arrayLoc]);

      float b = blue(cam.pixels[arrayLoc]);

      strokeWeight(random(.125, .5));

      fill(r+random(-15, 15), g+random(-15, 15), b+random(-15, 15));

      rect(xvals[i], yvals[i], random(boxSizes[i]), random(boxSizes[i]));

      moveRect();
    }
  }
}

void moveRect() {

  //go through the entire set of boxes...
  for (int i = 0; i < xvals.length; i++) {
    //get all the rest of the boxes
    for (int j = 0; j < xvals.length; j++) {
      //don't compare the same box to itself
      if (j!=i) {
        //check to see if my x location is close to another boxes' x location
        if (xvals[i]>xvals[j]-boxSizes[i]*2 && xvals[i]<xvals[j]+boxSizes[i]*2 && yvals[i]>yvals[j]-boxSizes[i]*2 && yvals[i]<yvals[j]+boxSizes[i]*2) {

          speedThreshold[i] = 150;
        }
      }
    }
  }
  //assign speed

  for (int i = 0; i<xspeed.length; i++) {

    xspeed[i] = random(-speedThreshold[i], speedThreshold[i]);

    speedThreshold[i] = .35;
  }


  for (int i = 0; i<yspeed.length; i++) {

    yspeed[i] = random(-speedThreshold[i], speedThreshold[i]);

    speedThreshold[i] = .35;
  }

  for (int i = 0; i<xvals.length; i++) {

    xvals[i] += xspeed[i];

    if (xvals[i]>=width-boxSizes[i]) {

      xvals[i] *= -1;

      xvals[i] = width-boxSizes[i];
    }

    if (xvals[i]<=0) {

      xvals[i] *= -1;

      xvals[i] = 0;
    }

    if (yvals[i]>=height-boxSizes[i]) {

      yvals[i] *= -1;

      yvals[i] = height-boxSizes[i];
    }

    if (yvals[i]<=0) {

      yvals[i] *= -1;

      yvals[i] = 10;
    }
  }
  //adding the speed to the location

  for (int i = 0; i<yvals.length; i++) {

    yvals[i] += yspeed[i]*2;
  }
}



void mousePressed() {
  if (mouseButton == LEFT) {

    background(255);
  }

  if (mouseButton == RIGHT) {

    background(0);
  }
}

void keyPressed() {
  if (key =='s' || key=='S') {
    saveFrame("myfile_#########.jpg");
  }
}