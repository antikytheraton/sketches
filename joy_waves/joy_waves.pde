float A = height/2;
float diameter = 20;
float radius = diameter / 2;
float frequency = .10;
float time = 0;

void setup() {
  size(980, 300);
}

void draw() {
  background(0);
  translate(0, height/2);
  for (float x = radius; x <= width-radius; x += diameter*1.5) {
    float phi = -x*.41;
    ellipse(x, A*sin(frequency*time + phi), diameter, diameter);
  }
  time += .5;
}