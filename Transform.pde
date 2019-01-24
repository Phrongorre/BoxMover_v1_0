/* Transform.pde
 * 
 * World location object to aid in location nesting and managing complex combinations of location and rotation.
 * 
 * J Karstin Neill 01.24.2019
 */

public class Transform {
  private Coord mLocation, mScale;
  private double mRotation;
  private Transform mParent;
   
   public Transform() {
     this.setLocation(new Coord());
     this.setRotation(0.0);
     this.setScale(new Coord(1.0, 1.0, 1.0));
     this.setParent(null);
   }
   
   public Transform(Transform p) {
     this.setLocation(new Coord());
     this.setRotation(0.0);
     this.setScale(new Coord(1.0, 1.0, 1.0));
     this.setParent(p);
   }
   
   public Transform(Coord loc, double rot, Coord scl) {
     this.setLocation(loc);
     this.setRotation(rot);
     this.setScale(scl);
     this.setParent(null);
   }
   
   public Transform(Coord loc, double rot, Coord scl, Transform p) {
     this.setLocation(loc);
     this.setRotation(rot);
     this.setScale(scl);
     this.setParent(p);
   }
   
   public Coord location() {
     if (this.parent() == null) return this.mLocation;
     else return this.parent().location().plus(this.mLocation.rotated(this.parent().rotation()).scaledBy(this.parent().scale()));
   }
   
   public double rotation() {
     if (this.parent() == null) return this.mRotation;
     else return this.parent().rotation()+this.mRotation;
   }
   
   public Coord scale() {
     return this.mScale;
   }
   
   public Transform parent() {
     return this.mParent;
   }
   
   public void setLocation(Coord loc) {
     this.mLocation = loc;
   }
   
   public void setRotation(double rot) {
     this.mRotation = rot;
   }
   
   public void setScale(Coord scl) {
     this.mScale = scl;
   }
   
   public void setParent(Transform p) {
     this.mParent = p;
   }
}
