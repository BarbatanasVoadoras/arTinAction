PImage img; 

void setup() {
  size(750, 500);
  img = loadImage("clarice.jpg");
  img.resize(750, 500);
}

void draw() {
  background(200);
  fill(0);
  noStroke();
  float tiles = mouseX/10;
  float tileSize = width/tiles;
  translate(tileSize/2,tileSize/2);
  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      //color c = img.get(int(x*tileSize),int(y*tileSize));
      color c = img.get(int(x*tileSize),int(y*tileSize));
      //float size = map(brightness(c),0,255,tileSize,0);    
      float size = map(brightness(c),0,255,tileSize,0);
      ellipse(x*tileSize, y*tileSize, size, size);
    }
  }
}
