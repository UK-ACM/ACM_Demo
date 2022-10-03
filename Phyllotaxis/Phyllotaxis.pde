float y;
float x;
float ang;
float n = 0;
float c = 4;
float r;


void setup() {
  size(400, 400);
  background(51);
  
}

void draw() {
  translate(width/2, height/2);
  fill(255);
  ang = n * 137.5;
  //ang = ang * 180 / PI;
  r = c * sqrt(n);


  x = r * cos(ang);
  y = r * sin(ang);
  ellipse(x, y, 5, 5);
  n++;
}
