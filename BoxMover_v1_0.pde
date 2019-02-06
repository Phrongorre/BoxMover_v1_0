/* BoxMover_v1_0.pde
 * 
 * Basic game engine designed for 2D-2.5D graphics.
 * 
 * J Karstin Neill 01.23.2019
 */

//JUST LEARNED ABOUT PSHAPE AND IN PROCESS OF LEARNING CAPABILITIES FOR 3D ENGINE...
//STANDBY

PImage img;
PShape globe;

float depth = 50;

Box b;

void setup() {
  size(1000, 1000, P3D);
  img = loadImage("buildings.jpg");
  globe = createShape(SPHERE, 50);
  globe.setTexture(img);
  
  b = new Box();
  b.setTransform(new Transform(new Coord(100, 100), 0));
  b.collider().setSize(new Coord(40, 40));
}

void mouseWheel(MouseEvent event) {
  depth += -25*event.getCount();
}

void draw() {
  background(255);
  translate(mouseX, mouseY, depth);
  shape(globe);
  translate(-mouseX, -mouseY, -depth);
  
  b.show();
}
