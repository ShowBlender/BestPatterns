PImage img;
int gridSpacing = 40;

int cols, rows;

void setup() {
size(displayWidth, displayHeight, P3D); 
  img = loadImage("ShowBlender.png");
  cols = width/gridSpacing;
  rows = height/gridSpacing;
}

void draw() {

  background(-1);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i*gridSpacing;
      int y = j*gridSpacing;
      fill(0);
      stroke(255);
      rect(x, y, gridSpacing, gridSpacing);
    }
  }
  line(0,0,displayWidth,displayHeight);
  line(displayWidth,0,0,displayHeight);
  ellipse(displayWidth/2,displayHeight/2,displayHeight,displayHeight);
  textSize(32);
  fill(0, 102, 153, 204);
  textAlign(CENTER, CENTER);
  text(displayWidth,displayWidth/2,displayHeight/2-50, 30);
  text(displayHeight,displayWidth/2,(displayHeight/2)+50, 31);
  fill(255, 0, 0);
  rect(displayWidth*.2,displayHeight*.2,displayWidth*.1,displayHeight*.1);
  fill(0, 255, 0);
  rect(displayWidth*.45,displayHeight*.2,displayWidth*.1,displayHeight*.1);
  fill(0, 0, 255);
  rect(displayWidth*.7,displayHeight*.2,displayWidth*.1,displayHeight*.1);
  image(img, displayWidth*.375,displayHeight*.65,displayWidth*.25,displayHeight*.25);
}

boolean sketchFullScreen() {
  return true;
}

