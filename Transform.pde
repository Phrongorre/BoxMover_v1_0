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
   
   //Returns GLOBAL location Coord calculated using all encapsulating parents' Transform data
   public Coord location() {
     if (this.parent() == null) return this.mLocation;
     else return this.parent().location().plus(this.mLocation.rotated(this.parent().rotation()));
   }
   
   //Specialized method which always returns LOCAL location Coord, regardless of parent's Transform data
   public Coord locationLocal() {
     return this.mLocation;
   }
   
   //Returns GLOBAL rotation float calculated using all encapsulating parent's Transform data
   public float rotation() {
     if (this.parent() == null) return this.mRotation;
     else return this.parent().rotation()+this.mRotation;
   }
   
   //Specialized method which always returns LOCAL rotation float, regardless of parent's Transform data
   public float rotationLocal() {
     return this.mRotation;
   }
   
   public Transform parent() {
     return this.mParent;
   }
   
   //Set LOCAL location Coord values
   public void setLocation(Coord loc) {
     if (this.mLocation == null) this.mLocation = new Coord();
     this.mLocation.copy(loc);
   }
   
   //Set GLOBAL location Coord values
   //(note: LOCAL location Coord values may not be equal to passed argument after execution takes place)
   public void setLocationGlobal(Coord loc) {
     if (this.parent() == null) this.setLocation(loc);
     else {
       if (this.mLocation == null) this.mLocation = new Coord();
       float rot0 = this.parent().rotation() - loc.angleOfIncidenceAbout(this.parent().location());
       float dist = this.parent().location().distanceFrom(loc);
       this.mLocation.copy(new Coord(dist*cos(rot0), dist*sin(rot0)));
     }
   }
   
   //Set LOCAL rotation float value
   public void setRotation(float rot) {
     this.mRotation = rot;
   }
   
   //Set GLOBAL rotation float value
   //(note: LOCAL rotation may not be equal to passed argument after execution takes place)
   public void setRotationGlobal(float rot) {
     this.mRotation = rot-this.parent().rotation();
   }
   
   public void setParent(Transform p) {
     this.mParent = p;
   }
   
   //Apply linear translation relative to Transform's LOCAL space
   //(note: changes value stored in Transform::mLocation)
   public void translate(Coord c) {
     this.mLocation.add(c);
   }
   
   //Apply linear translation relative to GLOBAL space
   //(note: changes value stored in Transform::mLocation)
   //(note: changes to LOCAL location Coord may not be equivalent to passed Coord argument after execution takes place)
   public void translateGlobal(Coord c) {
     this.mLocation.add(c.rotated(-this.parent().rotation()));
   }
   
   //Apply rotation to Transform's LOCAL/GLOBAL rotation
   //(note: changes value stored in Transform::mRotation)
   public void rotate(float rot) {
     this.mRotation += rot;
   }
}
