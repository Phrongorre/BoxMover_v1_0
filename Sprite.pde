/* Sprite.pde
 * 
 * Base image presentation object.
 * 
 * Helpful sources: https://processing.org/reference/image_.html
 * 
 * J Karstin Neill 01.24.2019
 */
 
public class Sprite {
  private PImage mImage;
  
  public Sprite() {
    
  }
  
  public Sprite(String imageName) {
    PImage tmp = loadImage(imageName);
    if (tmp == null) print("Image file '" + imageName + "' not found!");
    this.mImage = tmp;
  }
  
  public void display() {
    //TODO: Read into image shearing and image loadPixels() method
    if (this.mImage != null) image(this.mImage, 0, 0);
  }
}
