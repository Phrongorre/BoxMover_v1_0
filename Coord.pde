/* Coord.pde
 * 
 * Coordinate unit for management of points in "3D" space.
 * 
 * J Karstin Neill 01.24.2019
 */

public class Coord {
  private float mX, mY, mZ;
  
  public Coord() {
    this.setX(0.0);
    this.setY(0.0);
    this.setZ(0.0);
  }
  
  public Coord(float x, float y) {
    this.setX(x);
    this.setY(y);
    this.setZ(0.0);
  }
  
  public Coord(float x, float y, float z) {
    this.setX(x);
    this.setY(y);
    this.setZ(z);
  }
  
  public Coord(Coord c) {
    this.setX(c.x());
    this.setY(c.y());
    this.setZ(c.z());
  }
  
  public float x() {
    return this.mX;
  }
  
  public float y() {
    return this.mY;
  }
  
  public float z() {
    return this.mZ;
  }
  
  public void setX(float x) {
    this.mX = x;
  }
  
  public void setY(float y) {
    this.mY = y;
  }
  
  public void setZ(float z) {
    this.mZ = z;
  }
  
  public void copy(Coord c) {
    this.setX(c.x());
    this.setY(c.y());
    this.setZ(c.z());
  }
  
  public Coord plus(Coord c) {
    Coord ret = new Coord(this.x()+c.x(), this.y()+c.y(), this.z()+c.z());
    return ret;
  }
  
  public void add(Coord c) {
    this.copy(this.plus(c));
  }
  
  public Coord times(float m) {
    Coord ret = new Coord(this.x()*m, this.y()*m, this.z()*m);
    return ret;
  }
  
  public void multiplyBy(float m) {
    this.copy(this.times(m));
  }
  
  public Coord negative() {
    return this.times(-1.0);
  }
  
  public void negate() {
    this.copy(this.negative());
  }
  
  public Coord minus(Coord c) {
    return this.plus(c.negative());
  }
  
  public void subtract(Coord c) {
    this.copy(this.minus(c));
  }
  
  public Coord dividedBy(float d) {
    if (d < 0.00 || d > 0.00) return this.times(1.0/d);
    else print("Cannot divide by zero!");
    return null;
  }
  
  public void divideBy(float d) {
    this.copy(this.dividedBy(d));
  }

  public Coord rotated(float angle) {
    Coord ret = new Coord(this.x()*cos(angle)-this.y()*sin(angle), this.x()*sin(angle)+this.y()*cos(angle));
    return ret;
  }
  
  public void rotate(float angle) {
    this.copy(this.rotated(angle));
  }
  
  public Coord rotatedAbout(Coord pivot, float angle) {
    return this.minus(pivot).rotated(angle).plus(pivot);
  }
  
  public void rotateAbout(Coord pivot, float angle) {
    this.copy(this.rotatedAbout(pivot, angle));
  }
  
  public float distance() {
    return sqrt(pow(this.x(), 2)+pow(this.y(), 2)+pow(this.z(), 2));
  }
  
  public float distanceFrom(Coord c) {
    return c.minus(this).distance();
  }
  
  //Returns angle from positive x-axis this Coord makes
  public float angleOfIncidence() {
    return atan(this.y()/this.x());
  }
  
  //Returns angle from positive x-axis this Coord makes when interpreting passed argument as origin Coord
  public float angleOfIncidenceAbout(Coord c) {
    return this.minus(c).angleOfIncidence();
  }
}
