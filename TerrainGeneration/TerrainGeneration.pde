int scale = 20;
int cols, rows;
int Width, Height;
float xoff, yoff;
float zScale = 40;
float flying;

float[][] Terrain;
void setup(){
   size(600, 600, P3D); 
   background(0);
   Width = 1000;
   Height = 600;
   cols = Width / scale;
   rows = Height / scale;
   
  Terrain = new float[Width][Height];
   
  flying = 0;
  
}


void draw() {
  background(0);
  stroke(255);
  noFill();
  
  
  xoff = 0;
  yoff = flying;
  
  for(int i = 0; i < Width; i++) {
  for(int j = 0; j < Height; j++) {
      Terrain[i][j] = map(noise(xoff,yoff),0,1,-zScale, zScale);
      yoff += 0.25;
   }
   xoff+=0.25;
  }
  
  
  translate(0,Height/3);
  rotateX(PI/2.5);
  
  
  for(int y = 0; y < cols;y++) {
   
      beginShape(TRIANGLE_STRIP);
     for(int x = 0; x < rows; x++) {
      vertex(x*scale, y*scale, Terrain[x][y]);
      vertex(x*scale, (y+1) * scale, Terrain[x][y+1]);
      
    }
     endShape();
   }
  
  
 flying -= 0.05; 
 
}
