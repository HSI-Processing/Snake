/** Class: PowerUp
  * Represents a power-up item in the game that can be activated, drawn on the screen, and repositioned.
  */
public class PowerUp {
  
    // Power-up coordinates
    private int x;
    private int y;

    // Power-up state
    private boolean isActive;

  /** Constructor: PowerUp()
    * Initializes the power-up as inactive.
    */
    public PowerUp() {
        isActive = false;
    }

  /** Method: drawMe()
    * Renders the power-up on the screen if it is active.
    */
    public void drawMe() {
        if (isActive) {
            fill(255, 255, 0);
            square(x, y, 20);
        }
    }
    
  /** Method: spawnPowerUp()
    * Spawns the power-up at a random position, ensuring it does not overlap with the serpent.
    * Activates the power-up upon spawning.
    * @param serpent The serpent object to avoid overlapping with.
    */
    public void spawnPowerUp(Serpent serpent) {
        isActive = true;
        boolean isOccupied;
        do {
            isOccupied = false;

            // Generate random coordinates for the power-up within grid bounds
            x = (int) random(width / 20) * 20;
            y = (int) random(height / 20) * 20;

            // Check if power-up overlaps with the serpent's head
            if (x == serpent.x && y == serpent.y) {
                isOccupied = true;
            }
            // Check if power-up overlaps with any of the serpent's segments
            for (Segment part : serpent.segments) {
                if (x == part.x && y == part.y) {
                    isOccupied = true;
                }
            }
        } while (isOccupied);
    }
}
