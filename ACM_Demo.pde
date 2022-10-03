static final int LANGTONS_ANT = 1;
static final int DEMO_OPTION = LANGTONS_ANT;

static final int SIZE = 600;
static final int SPEEDUP = 1000;

void setup() {
  size(600, 600);
  background(0);
  
}

void draw() {
  background(0);
  fill(255);
  
  if(DEMO_OPTION == LANGTONS_ANT) {
    for(int i = 0; i < SPEEDUP; i++)
      LangtonAntStep();
    LangtonAntDraw();
  }
  
}
