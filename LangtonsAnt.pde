// Langton's Ant Setup

static int[][] LangtonPixelArray = new int[SIZE][SIZE];
static int[] LangtonPos = {SIZE/2, SIZE/2}; 
static int[] LangtonDir = {0, 1};

void LangtonAntStep() {
    if( LangtonPixelArray[LangtonPos[0]][LangtonPos[1]] == 1) {
      LangtonPixelArray[LangtonPos[0]][LangtonPos[1]] = 0;
      int temp = LangtonDir[0];
      LangtonDir[0] = -LangtonDir[1];
      LangtonDir[1] = temp;
    }
    else {
      LangtonPixelArray[LangtonPos[0]][LangtonPos[1]] = 1;
      int temp = -LangtonDir[0];
      LangtonDir[0] = LangtonDir[1];
      LangtonDir[1] = temp;
    }
    
    LangtonPos[0] += LangtonDir[0];
    LangtonPos[1] += LangtonDir[1];
    //print(LangtonPos[0], LangtonPos[1], "\n");
    
    if(LangtonPos[0] >= SIZE) LangtonPos[0] = 0;
    if(LangtonPos[1] >= SIZE) LangtonPos[1] = 0;
    if(LangtonPos[0] < 0) LangtonPos[0] = SIZE-1;
    if(LangtonPos[1] < 0) LangtonPos[1] = SIZE-1;
}

void LangtonAntDraw() {
    loadPixels();
    for(int i = 0; i < width * height; i++) {
      int x = i / width;
      int y = i % height;
      float r = map(x, 0, width-1, 0, 255);
      float g = map(y, 0, height-1, 0, 255);
      if(LangtonPixelArray[x][y] == 1) pixels[i] = color(r, g, 255);
    }
    updatePixels();
  
}
