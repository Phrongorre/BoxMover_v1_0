/* Transform.pde
 * 
 * World location object to aid in location nesting and managing complex combinations of location and rotation.
 * 
 * J Karstin Neill 01.24.2019
 */

public class Transform {
  private Coord mLocation;
  private float mRotation;
  private Transform mParent;
   
   public Transform() {
     this.setLocation(new Coord());
     this.setRotation(0.0);
     this.setParent(null);
   }
   
   public Transform(Transform p) {
     this.setLocation(new Coord());
     this.setRotation(0.0);
     this.setParent(p);
   }
   
   public Transform(Coord loc, float rot) {
     this.setLocation(loc);
     this.setRotation(rot);
     this.setParent(null);
   }
   
   public Transform(Coord loc, float rot, Transform p) {
     this.setLocation(loc);
     this.setRotation(rot);
     this.setParent(p);
   }
   
   public Coord location() {
     if (this.parent() == null) return this.mLocation;
     else return this.parent().location().plus(this.mLocation.rotated(this.parent().rotation()));
   }
   
   public float rotation() {
     if (this.parent() == null) return this.mRotation;
     else return this.parent().rotation()+this.mRotation;
   }
   
   public Transform parent() {
     return this.mParent;
   }
   
   public void setLocation(Coord loc) {
     this.mLocation = loc;
   }
   
   public void setRotation(float rot) {
     this.mRotation = rot;
   }
   
   public void setParent(Transform p) {
     this.mParent = p;
   }
}
