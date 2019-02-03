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

float radius = 50;

void setup() {
  size(1000, 1000, P3D);
  img = loadImage("buildings.jpg");
  globe = createShape(SPHERE, radius);
  globe.setTexture(img);
}

void mouseWheel(MouseEvent event) {
  radius += -15*event.getCount();
  globe = createShape(SPHERE, radius);
  globe.setTexture(img);
}

void draw() {
  background(0);
  translate(mouseX, mouseY);
  shape(globe);
}
