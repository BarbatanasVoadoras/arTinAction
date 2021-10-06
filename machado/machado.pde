void preload() {
    img = loadImage('machado.jpg');
}

void setup() {
    createCanvas(720, 800);
    let cvn = createCanvas(1000, 1000);
    let x = (windowWidth - width) / 2;
    let y = (windowHeight - height) / 2;
    cvn.position(x,y);
    smallPoint = 5;
    largePoint = 20;
    noStroke();
    background(255);
    image(img, 0, 0, 720, 800);
    img.loadPixels();
    frameRate(fr);
}

void draw() {
    let pointillize = map(mouseX, 0, width, smallPoint, largePoint);
    let x = floor(random(img.width));
    let y = floor(random(img.height));
    let pix = img.get(x, y);
    fill(pix);
    ellipse(x, y, pointillize, pointillize);
}
