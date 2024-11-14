/** Class: Apple
  * Handles functions of apple objects within the game.
  */
public class Apple{
  // Apple position coordinates
  private int x;
  private int y;
  
  /** Constructor: Apple()
    * Initializes apple position by calling spawnApple.
    * @param serpent The serpent object to avoid positioning the apple on.
    */
  public Apple(Serpent serpent){
    spawnApple(serpent);
  }
  
  /** Method: drawMe()
    * Draws the apple on screen at its current position.
    */
  public void drawMe()
  {
    fill(255,100,100);
    square(x, y, 20);
  }
  
  /** Method: spawnApple()
    * Sets the apple's position to a random location, ensuring it does not overlap with the serpent.
    * @param serpent The serpent object to check against.
    */
  public void spawnApple(Serpent serpent){
    boolean isOccupied;
    
    do{
      isOccupied = false;
      
      // Generate random x and y positions within the grid
      x = (int)random(width/20) * 20;
      y = (int)random(height/20) * 20;
      
      // Check if the apple's position overlaps with the serpent's head
      if (x == serpent.x && y == serpent.y)
      {
        isOccupied = true;
      }
      
      // Check if the apple's position overlaps with any of the serpent's segments
      for (Segment part : serpent.segments){
        if (x == part.x && y == part.y){
          isOccupied = true;
        }
      }
    }
    while (isOccupied);
  }
}
