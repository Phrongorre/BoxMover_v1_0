/* Coord.pde
 * 
 * Coordinate unit for management of points in "3D" space.
 * 
 * J Karstin Neill 01.23.2019
 */

public class Coord {
  private double mX, mY, mZ;
  
  public Coord() {
    this.setX(0.0);
    this.setY(0.0);
    this.setZ(0.0);
  }
  
  public Coord(double x, double y, double z) {
    this.setX(x);
    this.setY(y);
    this.setZ(z);
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
  
  public Coord plus(Coord c) {
    Coord ret = new Coord(this.x()+c.x(), this.y()+c.y(), this.z()+c.z());
    return ret;
  }
  
  public Coord times(double m) {
    Coord ret = new Coord(this.x()*m, this.y()*m, this.z()*m);
    return ret;
  }
  
  public Coord negate() {
    return this.times(-1.0);
  }
  
  public Coord minus(Coord c) {
    return this.plus(c.negate());
  }
  
  public Coord dividedBy(double d) {
    if (d < 0.00 || d > 0.00) return this.times(1.0/d);
    else print("Cannot divide by zero!");
    return null;
  }
}
