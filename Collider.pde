/* Collider.pde
 * 
 * Structure to handle mathematics behind collision detection and management.
 *
 * Design note: Collider::mTransform is interpreted
 *   as an OFFSET or CHILD Transform to the encapsulating Box::mTransform object.
 *   All Collider collision detection methods use Collider::mTransform in conjunction
 *   with Collider::mSize, which is interpreted locally to Collider::mTransform. As such,
 *   a Collider object behaves most naturally when setting its Transform::mParent field
 *   to the encapsulating Box::mTransform field. This is done automatically upon creation of a
 *   Box object (see Box.pde for more detail), so the developer does
 *   not need to focus on this detail, unless this class is applied
 *   without the use of encapsulating "helper" classes like Box.
 * 
 * J Karstin Neill 01.23.2019
 */

public class Collider {
  private Transform mTransform;
  private Coord mSize;
  
  public Collider() {
    this.setTransform(new Transform());
    this.setSize(new Coord());
  }
  
  public Collider(Transform t, Coord s) {
    this.setTransform(t);
    this.setSize(s);
  }
  
  public Transform transform() {
    return this.mTransform;
  }
  
  public Coord size() {
    return this.mSize;
  }
  
  public void setTransform(Transform t) {
    this.mTransform = t;
  }
  
  public void setSize(Coord s) {
    this.mSize = s;
  }
  
  public boolean contains(Coord c) {
    float unrot = -this.transform().rotation();
    Coord tl = this.transform().location().rotated(unrot);
    Coord br = tl.plus(this.size());
    Coord c0 = c.rotated(unrot);
    
    if (c0.x() >= tl.x() && c0.x() <= br.x() &&
        c0.y() >= tl.y() && c0.y() <= br.y())
      return true;    
    return false;
  }
}
