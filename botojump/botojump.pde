PImage bg;
PImage fg;
float x,y;
float hr,vr;

void setup() {
  size(700,661);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("pescador.png");
  fg = loadImage("boto.png");
  x = 310;
  y = 140;
  hr = fg.width;
  vr = fg.height;
  noStroke();
}

void draw() {
  background(bg);
  //image(fg);
    // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
  }
  image(fg, x, y);

  
  
  
}
