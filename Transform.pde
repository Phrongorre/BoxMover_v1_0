/* Transform.pde
 * 
 * World location object to aid in location nesting and managing complex combinations of location and rotation.
 * 
 * J Karstin Neill 01.23.2019
 */

public class Transform {
  private Coord mLocation, mRotation, mScale;
  private Transform mParent;
   
   public Transform() {
     this.setLocation(new Coord());
     this.setRotation(new Coord());
     this.setScale(new Coord(1.0, 1.0, 1.0));
     this.setParent(null);
   }
   
   public Transform(Transform p) {
     this.setLocation(new Coord());
     this.setRotation(new Coord());
     this.setScale(new Coord(1.0, 1.0, 1.0));
     this.setParent(p);
   }
   
   public Transform(Coord loc, Coord rot, Coord scl) {
     this.setLocation(loc);
     this.setRotation(rot);
     this.setScale(scl);
     this.setParent(null);
   }
   
   public Transform(Coord loc, Coord rot, Coord scl, Transform p) {
     this.setLocation(loc);
     this.setRotation(rot);
     this.setScale(scl);
     this.setParent(p);
   }
   
   public void setLocation(Coord c) {
     this.mLocation = c;
   }
   
   public void setRotation(Coord c) {
     this.mRotation = c;
   }
   
   public void setScale(Coord c) {
     this.mScale = c;
   }
   
   public void setParent(Transform p) {
     this.mParent = p;
   }
}
