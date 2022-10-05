float[] values;
int i = 0;
int j = 0;
void setup() {
  fullScreen();
  values = new float[width];
  for (int i = 0; i < values.length; i++) {
    values[i] = random(height);
  }

  //for (int i = 0; i < values.length; i++) {
  //  for (int j = 0; j < values.length -i - 1; j++) {
  //    float a = values[j];
  //    float b = values[j + 1];
  //    if (a>b) {
  //      swap(values, j, j+1);
  //    }
  //  }
  //}
}


void draw() {
  background(0);
  stroke(255);


  for (int i = 0; i < values.length; i++) { 
    line(i, height, i, height - values[i]);
  }

  if (i < values.length) { 
    for (int j = 0; j < values.length -i - 1; j++) {
      float a = values[j];
      float b = values[j + 1];
      if (a>b) {
        swap(values, j, j+1);
      }
    }
  }
  i++;
}

void swap(float[] arr, int a, int b) {
  float save = arr[a];
  arr[a] = arr[b];
  arr[b] = save;
}
