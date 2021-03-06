import processing.pdf.*;

PImage monalisa;

int col;
float r,g,b,bright;

void setup() {
  size(400,400);
  
  monalisa=loadImage("monalisa.jpg");
  
  noLoop();
  smooth();
// Uncomment to output to PDF  
  beginRecord(PDF, "Mona Lisa.pdf");
  background(24);
}

void draw() {
  
  noStroke();
  for(int i=0; i<40; i++) {
    for(int j=0; j<40; j++) {
      col=monalisa.get(i*10,j*10);
      r=red(col);
      g=green(col);
      b=blue(col);
      bright=(brightness(col)/255)*10;
      
      fill(r,g,b);
      ellipse(i*10,j*10, bright*1.5, bright*1.5);
    }
  }

  // Uncomment to output to PDF  
  endRecord();
}
