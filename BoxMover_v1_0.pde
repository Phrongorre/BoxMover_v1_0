/* BoxMover_v1_0.pde
 * 
 * Basic game engine designed for 2D-2.5D graphics.
 * 
 * J Karstin Neill 01.23.2019
 */

Transform t;
Box b;
Coord c;

void setup() {
  size(1000, 1000);

  t = new Transform(new Coord(150, 150), 0);
 
  b = new Box();
  b.setTransform(new Transform(new Coord(-50, -50), 0, t));
  b.collider().setSize(new Coord(40, 40));
 
  c = new Coord(120, 120);
}

void draw() {
  background(255);
  
  t.rotate(-0.5);
  b.transform().rotate(2);
  
  b.show();
  ellipse(c.x(), c.y(), 4, 4);
  
  println(b.collider().contains(c));
}
