// switches color version from pink to actual grass color, looks bad tho
boolean TerrainColor = true;

int scale = 20; //resolution of triangles
int cols, rows;
float xoff, yoff; // offset from 0 for perlin noise
float zScale = 200; // height differential for mountains
float flying; // allows for terrain to feel like it is moving
float noiseOffsetScale = 0.05; // amount to adjust noise offsets by

// width and height of terrain, exclusive from window size
int Width = 2600;
int Height = 1400;

// array to contain the terrain height values
float[][] Terrain;

void setup() {
  size(1400, 1000, P3D);
  frameRate(30);

  // calc columns and rows
  cols = Width / scale;
  rows = Height / scale;

  Terrain = new float[cols][rows];
  flying = 0;
}


void draw() {

  // set color options for grass vs. pink 
  blendMode(BLEND);
  if (TerrainColor) {
    //background(180, 200, 250);
    background(30);
    stroke(50);
  } else {
    background(20);
    fill(255, 70, 150);
    stroke(200);
  }


  // move forward
  flying -= noiseOffsetScale;
  yoff = flying;
  for (int j = 0; j < rows; j++) {
    xoff = 0;
    for (int i = 0; i < cols; i++) {
      // calculate z value using perlin noise mapped from [0,1] -> [-zScale,zScale]
      Terrain[i][j] = map(noise(xoff, yoff), 0, 1, -zScale, zScale);
      xoff+=noiseOffsetScale;
    }
    yoff+=noiseOffsetScale;
  }

  // translate to center of window
  translate(width/2, height/2);
  rotateX(PI/3); // rotate up for view
  translate(-Width/2, -Height/2); // shift back to get entire terrain in view


  // draw terrain
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP); // begin a triangle strip shape
    for (int x = 0; x < cols; x++) {
      stroke(50, map(y, 0, rows/5, 0, 255));
      //noStroke();
      float z1 = Terrain[x][y]; // calculate first vertex z-value and set color options
      if (TerrainColor) {
        if (z1 > zScale/3) fill(255, map(y, 0, rows/5, 0, 255));
        else if (z1 > -zScale/3) fill(50, 120, 30, map(y, 0, rows/5, 0, 255));
        else if (z1 > -zScale/2) fill(200, 140, 40, map(y, 0, rows/5, 0, 255));
        else fill(90, 150, 230, map(y, 0, rows/5, 0, 255));
      }
      vertex(x*scale, y*scale, z1); // draw vertex

      float z2 = Terrain[x][y+1]; // calculate second vertex z-value and set color options
      if (TerrainColor) {
        if (z2 > zScale/3) fill(255, map(y, 0, rows/5, 0, 255));
        else if (z2 > -zScale/3) fill(50, 120, 30, map(y, 0, rows/5, 0, 255));
        else if (z2 > -zScale/2) fill(200, 140, 40, map(y, 0, rows/5, 0, 255));
        else fill(90, 150, 230, map(y, 0, rows/5, 0, 255));
      }
      vertex(x*scale, (y+1) * scale, z2); // draw vertex
    }
    endShape(); // finish strip
  }
}
