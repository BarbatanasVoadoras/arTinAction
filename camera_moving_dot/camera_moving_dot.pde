import processing.video.*;

Capture video;

PImage prevFrame, img;

float threshold = 150;
int Mx = 0;
int My = 0;
int ave = 0;

int ballX = width/2;
int ballY = height/2;
int rsp = 10;

void setup() {
  size(750, 500);
  video = new Capture(this, width, height, 30);
 
  prevFrame = createImage(video.width,video.height,RGB);
  video.start();
  
  size(750, 500);
  img = loadImage("clarice.jpg");
  img.resize(750, 500);
}

void draw() {
  

  if (video.available()) {
    
    prevFrame.copy(video,0,0,video.width,video.height,0,0,video.width,video.height); 
    prevFrame.updatePixels();
    video.read();
  }
  
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();
  
  Mx = 0;
  My = 0;
  ave = 0;
  
 
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      
      int loc = x + y*video.width;            
      color current = video.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 
      
     
      float r1 = red(current); float g1 = green(current); float b1 = blue(current);
      float r2 = red(previous); float g2 = green(previous); float b2 = blue(previous);
      float diff = dist(r1,g1,b1,r2,g2,b2);
      
      
      if (diff > threshold) { 
        pixels[loc] = video.pixels[loc];
        Mx += x;
        My += y;
        ave++;
      } else {
        
        pixels[loc] = video.pixels[loc];
      }
    }
  }
  fill(255);
  rect(0,0, width, height);
  if(ave != 0){ 
    Mx = Mx/ave;
    My = My/ave;
  }
  if (Mx > ballX + rsp/2 && Mx > 50){
    ballX+= rsp;
  }else if (Mx < ballX - rsp/2 && Mx > 50){
    ballX-= rsp;
  }
  if (My > ballY + rsp/2 && My > 50){
    ballY+= rsp;
  }else if (My < ballY - rsp/2 && My > 50){
    ballY-= rsp;
  }
    
    updatePixels();
    background(200);
    noStroke();
    fill(200,0,0);
    ellipse(ballX, ballY, 50, 50);
    
    float tiles = ballX/10;
    float tileSize = width/tiles;
    translate(tileSize/2,tileSize/2);
    for (int x = 0; x < tiles; x++) {
      for (int y = 0; y < tiles; y++) {
        color c = img.get(int(x*tileSize),int(y*tileSize));
        float size = map(brightness(c),0,255,tileSize,0);
        ellipse(x*tileSize, y*tileSize, size, size);
      }
    }
}
