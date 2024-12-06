/** Class: Serpent
  * Represents the main character (snake) in the game with movement, growth, and collision detection.
  */

/** Constructor: Serpent()
    * Initializes the serpent's position, speed, and length.
    */
function Serpent (){

  this.isMoveX = false;
  this.isMoveY = false;
  this.segments = []; // use array for segments

  this.x = width / 2;
  this.y = height / 2;
  this.speedX = 0;
  this.speedY = 0;
  this.serpentLength = 3;

  /** Method: drawMe()
    * Draws the serpent's body segments and head on the screen.
    */
  this.drawMe = function() {
    fill(100, 255, 100); 

    this.segments.forEach((part) => {
      square(part.x, part.y, 20);
    });

    fill(34, 167, 59); 
    square(this.x, this.y, 20); 
  }

  /** Method: eat()
    * Checks if the serpent's head collides with an apple.
    * If so, increases length and returns true.
    * @param apple The apple to check collision with.
    * @return True if the serpent eats the apple, false otherwise.
    */
  this.eat = function(apple) {

    if (apple.x === this.x && apple.y === this.y) {
      this.serpentLength += 3; 
      return true;
    } 

    return false;
  }

  /** Method: eatPowerUp()
    * Checks if the serpent's head collides with a power-up.
    * @param powerUp The power-up to check collision with.
    * @return True if the serpent eats the power-up, false otherwise.
    */
  this.eatPowerUp = function(powerUp) {
    if (powerUp.x === this.x && powerUp.y === this.y) {
      return true;
    }
    return false;
  }

  /** Method: isDead()
    * Checks if the serpent has collided with walls or its own body.
    * If so, it calls the kill() method to end the game.
    * @return True if the serpent is dead, false otherwise.
    */
  this.isDead = function() {
    // Check if serpent collides with screen edges
    if (this.x < 0 || this.x >= width || this.y < 0 || this.y >= height) {
      this.kill();
      return true;
    } else {
    // Check if serpent collides with its own body
      for (let part of this.segments) {
        if (part.x === this.x && part.y === this.y) {
          this.kill();
          return true;
        }
      }
    }

    return false;
  }

  /** Method: kill()
    * Resets the serpent's length and position, effectively "killing" the serpent.
    */
  this.kill = function() {
    this.serpentLength = 0;         
    this.segments = []; // clear the array
    this.speedX = 0;
    this.speedY = 0;
    this.x = 20000;                  
  }

  /** Method: slither()
    * Updates the serpent's position and body segment positions to simulate movement.
    */
  this.slither = function() {
    // Check if serpent is moving
    if (this.speedX !== 0 || this.speedY !== 0) {

      // Add new segment if serpent grows
      if (this.segments.length < this.serpentLength) {
        this.segments.push(new Segment(this.x, this.y));
      } else {

        // Shift each segment to the position of the next segment in the list
        for (let i=0; i < this.segments.length - 1; i++) {
          this.segments[i].x = this.segments[i + 1].x;
          this.segments[i].y = this.segments[i + 1].y;
        }

        // Update the last segment's position to the head's previous position
        if (this.segments.length !== 0) {
          let back = this.segments[this.segments.length - 1];
          back.x = this.x;
          back.y = this.y;
        }
      }

      // Update head position based on current speed
      if (this.speedX != 0) {
        this.x += this.speedX;
        this.isMoveX = true;
        this.isMoveY = false;
      } else if (this.speedY != 0) {
        this.y += this.speedY;
        this.isMoveX = false;
        this.isMoveY = true;
      }

      // Align the head to the grid (20px)
      this.x = Math.floor(this.x / 20) * 20;  
      this.y = Math.floor(this.y / 20) * 20;  
    }
  }
}
