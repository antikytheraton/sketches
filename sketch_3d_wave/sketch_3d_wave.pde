// Pressing Control-R will render this sketch.


float theta = 0;
float r = 30;

void setup() {  // this is run once.   

  // set the background color
  background(2);

  // canvas size (Integers only, please.)
  size(600, 600); 

  // smooth edges
  smooth();

  // limit the number of frames per second
  frameRate(30);


  strokeWeight(1);
} 

void draw() {  // this is run repeatedly.  

  rotate(45);
  translate(0, -500);
  noStroke();
  fill(25, 30);

  rect(0, 0, 1200, 1200);


  noStroke();
  fill(0, 200, 88);

  int k = 0;
  int l = 0;
  for (int j = 0; j <= height + 260; j += 37) {
    for (int i = 0; i <= width + 260; i += 37) {

      float x = r * cos(theta + k);
      float y = r * sin(theta + l);
      k += 0.5;
      l += 0.5;

      // draw the orbiting ellipse
      noStroke();
      fill(0, map(i, 0, height+260, 0, 255), map(i, 0, height+260, 255, 0));
      ellipse(x+i, y+j, 30, 30);
    }
    k = 0;
    i = 0;
    l = 0;
  }    


  theta += 0.1;
}