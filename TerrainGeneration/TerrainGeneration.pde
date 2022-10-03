int scale = 20;
int cols, rows;
float xoff, yoff;
float zScale = 200;
float flying;
float noiseOffsetScale = 0.05;

int Width = 2600;
int Height = 1400;

float[][] Terrain;
void setup() {
  size(1400, 1000, P3D); 
  cols = Width / scale;
  rows = Height / scale;
  Terrain = new float[cols][rows];

  flying = 0;
}


void draw() {
  background(0);
  stroke(255);
  noFill();

  flying -= 0.02;
  yoff = flying;
  for (int j = 0; j < rows; j++) {
    xoff = 0;
    for (int i = 0; i < cols; i++) {
      Terrain[i][j] = map(noise(xoff, yoff), 0, 1, -zScale, zScale);
      xoff+=noiseOffsetScale;
    }
    yoff+=noiseOffsetScale;
  }


  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-Width/2, -Height/2);
  for (int y = 0; y < rows-1; y++) {

    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scale, y*scale, Terrain[x][y]);
      vertex(x*scale, (y+1) * scale, Terrain[x][y+1]);
    }
    endShape();
  }
}
