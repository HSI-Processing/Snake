/** Class: PowerUp
  * Represents a power-up item in the game that can be activated, drawn on the screen, and repositioned.
  */

/** Constructor: PowerUp()
    * Initializes the power-up as inactive.
    */
function PowerUp (){
  
  // Power-up coordinates
  this.x;
  this.y;

  this.isActive = false;

  /** Method: drawMe()
    * Renders the power-up on the screen if it is active.
    */
  this.drawMe = function() {
    if (this.isActive) {
        fill(255, 255, 0);
        square(this.x, this.y, 20);
    }
  }
    
  /** Method: spawnPowerUp()
    * Spawns the power-up at a random position, ensuring it does not overlap with the serpent.
    * Activates the power-up upon spawning.
    * @param serpent The serpent object to avoid overlapping with.
    */
  this.spawnPowerUp = function(serpent) {
    this.isActive = true;
    let isOccupied;

    do {
      isOccupied = false;

      // Generate random coordinates for the power-up within grid bounds and snap to multiples of 20
      this.x = Math.floor(random(width / 20)) * 20;
      this.y = Math.floor(random(height / 20)) * 20;

      // Check if power-up overlaps with the serpent's head
      if (this.x === serpent.x && this.y === serpent.y) {
        isOccupied = true;
      }

      // Check if power-up overlaps with any of the serpent's segments
      for (let part of serpent.segments) {
        if (this.x === part.x && this.y === part.y) {
          isOccupied = true;
        }
      }
    } while (isOccupied);
  }
}
