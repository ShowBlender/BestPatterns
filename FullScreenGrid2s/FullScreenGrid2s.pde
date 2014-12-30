import controlP5.*;  // for control

ControlP5 cp5;

controlP5.Button choice;  // Button for changing On-screen test patterns

PImage img;

int gridSpacing = 40;  // Width of grids
int cols, rows;
int patternCase = 0;
boolean isOpen;

void setup() {
  size(displayWidth, displayHeight, P3D); //Using P3D for Z-Order control
  img = loadImage("ShowBlender.png");
  cols = width/gridSpacing;
  rows = height/gridSpacing;

  cp5 = new ControlP5(this);
  // (1)
  // create some controllers
  choice = cp5.addButton("button")
    .setValue(1)
      .setPosition(20, 20)
        .setSize(100, 30)
          .setId(1);

  choice = cp5.addButton("patternCase")
    .setValue(0)
      .setPosition(100, 190)
        .setSize(200, 200)
          .setId(2);
}

void draw() {
  background(-1);
  switch(patternCase) {
  case 0:
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int x = i*gridSpacing;
        int y = j*gridSpacing;
        fill(0);
        stroke(255);
        rect(x, y, gridSpacing, gridSpacing);
      }
    }
    break;

  case 1:
    background(255, 255, 255);
    break;
  }
  line(0, 0, displayWidth, displayHeight);
  line(displayWidth, 0, 0, displayHeight);
  fill(0,0,0,0);
  ellipse(displayWidth/2, displayHeight/2, displayHeight, displayHeight);
  textSize(32);
  fill(0, 102, 153, 204);
  textAlign(CENTER, CENTER);
  text(displayWidth, displayWidth/2, displayHeight/2-50, 30);
  text(displayHeight, displayWidth/2, (displayHeight/2)+50, 31);
  fill(255, 0, 0);
  rect(displayWidth*.2, displayHeight*.2, displayWidth*.1, displayHeight*.1);
  fill(0, 255, 0);
  rect(displayWidth*.45, displayHeight*.2, displayWidth*.1, displayHeight*.1);
  fill(0, 0, 255);
  rect(displayWidth*.7, displayHeight*.2, displayWidth*.1, displayHeight*.1);
  image(img, displayWidth*.375, displayHeight*.65, displayWidth*.25, displayHeight*.25);
}

/*
boolean sketchFullScreen() {
 return true;  //This helped achieve accurate cross-platform fullscreen output
 }
 */

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.controller().id());
}

public void button(float theValue) {
  println("a button event. "+theValue);
  isOpen = !isOpen;
  patternCase = isOpen?1:0;
  cp5.controller("button").setCaptionLabel((isOpen==true) ? "GRIDS":"BARS");
}

