/** Class: Serpent
  * Represents the main character (snake) in the game with movement, growth, and collision detection.
  */
public class Serpent {

  // Serpent properties
  int x, y;                     
  int speedX, speedY;           
  int serpentLength;           
  boolean isMoveX, isMoveY;
  ArrayList<Segment> segments = new ArrayList();

  /** Constructor: Serpent()
    * Initializes the serpent's position, speed, and length.
    */
  public Serpent() {
    x = width / 2;
    y = height / 2;
    speedX = 0;
    speedY = 0;
    serpentLength = 3;
  }

  /** Method: drawMe()
    * Draws the serpent's body segments and head on the screen.
    */
  public void drawMe() {
    fill(100, 255, 100); 
    for (Segment part : segments) {
      square(part.x, part.y, 20);
    }

    fill(34, 167, 59); 
    square(x, y, 20); 
  }

  /** Method: eat()
    * Checks if the serpent's head collides with an apple.
    * If so, increases length and returns true.
    * @param apple The apple to check collision with.
    * @return True if the serpent eats the apple, false otherwise.
    */
  public boolean eat(Apple apple) {
    if (apple.x == x && apple.y == y) {
      serpentLength += 3; 
      return true;
    } else {
      return false;
    }
  }

  /** Method: eatPowerUp()
    * Checks if the serpent's head collides with a power-up.
    * @param powerUp The power-up to check collision with.
    * @return True if the serpent eats the power-up, false otherwise.
    */
  public boolean eatPowerUp(PowerUp powerUp) {
    if (powerUp.x == x && powerUp.y == y) {
      return true;
    }
    return false;
  }

  /** Method: isDead()
    * Checks if the serpent has collided with walls or its own body.
    * If so, it calls the kill() method to end the game.
    * @return True if the serpent is dead, false otherwise.
    */
  public boolean isDead() {
    // Check if serpent collides with screen edges
    if (x < 0 || x >= width || y < 0 || y >= height) {
      kill();
      return true;
    } else {
      // Check if serpent collides with its own body
      for (Segment part : segments) {
        if (part.x == x && part.y == y) {
          kill();
          return true;
        }
      }
    }
    return false;
  }

  /** Method: kill()
    * Resets the serpent's length and position, effectively "killing" the serpent.
    */
  public void kill() {
    serpentLength = 0;         
    for (int i = segments.size() - 1; i >= 0; i--) {
      segments.remove(i);  
    }
    speedX = 0;
    speedY = 0;
    x = 20000;                  
  }

  /** Method: slither()
    * Updates the serpent's position and body segment positions to simulate movement.
    */
  public void slither() {
    // Check if serpent is moving
    if (speedX != 0 || speedY != 0) {
      // Add new segment if serpent grows
      if (segments.size() < serpentLength) {
        segments.add(new Segment(x, y));
      } else {
        // Shift each segment to the position of the next segment in the list
        for (int i = 0; i < segments.size() - 1; i++) {
          Segment back = segments.get(i);
          Segment front = segments.get(i + 1);
          back.x = front.x;
          back.y = front.y;
        }

        // Update the last segment's position to the head's previous position
        if (segments.size() != 0) {
          Segment back = segments.get(segments.size() - 1);
          back.x = x;
          back.y = y;
        }
      }

      // Update head position based on current speed
      if (speedX != 0) {
        x += speedX;
        isMoveX = true;
        isMoveY = false;
      } else if (speedY != 0) {
        y += speedY;
        isMoveX = false;
        isMoveY = true;
      }
    }
  }
}
