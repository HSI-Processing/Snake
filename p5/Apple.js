/** Class: Apple
  * Handles functions of apple objects within the game.
  */

/** Constructor: Apple()
    * Initializes apple position by calling spawnApple.
    * @param serpent The serpent object to avoid positioning the apple on.
    */
function Apple(serpent){
  // Apple position coordinates
  this.x;
  this.y;
  this.serpent = serpent;
  
  /** Method: spawnApple()
    * Sets the apple's position to a random location, ensuring it does not overlap with the serpent.
    * @param serpent The serpent object to check against.
    */
  this.spawnApple = function(serpent){
    let isOccupied;

    do{
      isOccupied = false;

      // Generate random x and y positions within the grid and snap to multiples of 20
      this.x = Math.floor(random(width / 20)) * 20;
      this.y = Math.floor(random(height / 20)) * 20;
      
      // Check if the apple's position overlaps with the serpent's head
      if (this.x === serpent.x && this.y === serpent.y) {
        isOccupied = true;
      }

      // Check if the apple's position overlaps with any of the serpent's segments
      for (let part of serpent.segments) {
        if (this.x === part.x && this.y === part.y) {
          isOccupied = true;
        }
      }
    }
    while (isOccupied); // Keep trying until we find an empty spot
  }
  
  /** Method: drawMe()
    * Draws the apple on screen at its current position.
    */
  this.drawMe = function(){
    fill(255,100,100);
    square(this.x, this.y, 20);
  }
  
  // Initial apple spawn when the game starts
  this.spawnApple(this.serpent);
}
