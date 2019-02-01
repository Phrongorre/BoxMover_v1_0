/* Coord.pde
 * 
 * Coordinate unit for management of points in "3D" space.
 * 
 * J Karstin Neill 01.24.2019
 */

public class Coord {
  private double mX, mY, mZ;
  
  public Coord() {
    this.setX(0.0);
    this.setY(0.0);
    this.setZ(0.0);
  }
  
  public Coord(double x, double y) {
    this.setX(x);
    this.setY(y);
    this.setZ(0.0);
  }
  
  public Coord(double x, double y, double z) {
    this.setX(x);
    this.setY(y);
    this.setZ(z);
  }
  
  public Coord(Coord c) {
    this.setX(c.x());
    this.setY(c.y());
    this.setZ(c.z());
  }
  
  public double x() {
    return this.mX;
  }
  
  public double y() {
    return this.mY;
  }
  
  public double z() {
    return this.mZ;
  }
  
  public void setX(double x) {
    this.mX = x;
  }
  
  public void setY(double y) {
    this.mY = y;
  }
  
  public void setZ(double z) {
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
  
  public Coord times(double m) {
    Coord ret = new Coord(this.x()*m, this.y()*m, this.z()*m);
    return ret;
  }
  
  public void multiplyBy(double m) {
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
  
  public Coord dividedBy(double d) {
    if (d < 0.00 || d > 0.00) return this.times(1.0/d);
    else print("Cannot divide by zero!");
    return null;
  }
  
  public void divideBy(double d) {
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
}
