/* Box.pde
 * 
 * Basic game world object.
 * 
 * J Karstin Neill 01.23.2019
 */

public class Box {
   private Transform mTransform;
   private Sprite mSprite;
   private Collider mCollider;
   
   public Box() {
     this.setTransform(new Transform());
     this.setSprite(new Sprite());
     this.setCollider(new Collider());
     this.collider().transform().setParent(this.transform());
   }
   
   public Transform transform() {
     return this.mTransform;
   }
   
   public Sprite sprite() {
     return this.mSprite;
   }
   
   public Collider collider() {
     return this.mCollider;
   }
   
   public void setTransform(Transform t) {
     this.mTransform = t;
   }
   
   public void setSprite(Sprite s) {
     this.mSprite = s;
   }
   
   public void setCollider(Collider c) {
     this.mCollider = c;
   }
   
   public void move(Coord c) {
     
   }
   
   public void rotate() {
     
   }
}
