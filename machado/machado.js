let img;
let smallPoint, largePoint;
let fr = 100;

function preload() {
    img = loadImage('https://dcomercio.com.br/public/upload/gallery/2018/vidaeestilo/machado-de-assis-og.jpg');
}

function setup() {
    let cvn = createCanvas(img.width, img.height);
    let x = (windowWidth - width) / 2;
    let y = (windowHeight - height) / 2;
    cvn.position(x,y);
    smallPoint = 10;
    largePoint = 40;
    img.loadPixels();
    frameRate(fr);
}

points = []
function draw() {
    let pointillize = map(mouseX, 0, width, smallPoint, largePoint);
    let x = random(img.width), y = random(img.height);
    let pix = img.get(x, y);
    let dx = random(), dy = random(), sx = random(), sy = random();
    points.push( {x: x, y: y, color: pix, size: pointillize, dx: dx, dy: dy, sx: sx, sy: sy});

    noStroke();
    background(255);
    image(img, 0, 0, img.width, img.height);

    let t =  millis() * 0.01;
    for(let i= 0; i < points.length; i++ ) {
        let p = points[i];
        fill(p.color);
        // tremular os pontos
        let x = p.x + sin(PI * p.dx + t * p.sx) * 3;
        let y = p.y + sin(PI * p.dy + t * p.sy) * 3;
        ellipse(x, y, p.size, p.size);
    }
}
