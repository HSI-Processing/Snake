/** Class: GameOver
  * Handles Game Over display
  */
public class GameOver {

  // Button
  Button restartButton;
  
  // Language
  Language language;
  
  /** Constructor: GameOver()
    * Instantiates Language and Button
    * @param Language
    */
  public GameOver(Language language) {
    // Language
    this.language = language;
    
    // Initialize the restart button with the correct text
    String restartText = language.toSpanishCheck("RESTART", spanish);
    restartButton = new Button(width / 2 - 100, height / 2 + 100, 200, 50, restartText); // Adjusted position
  }

  /** Method: draw()
    * Displays Game Over screen
    */
  public void draw() {
    // Draw the Game Over text
    fill(255, 0, 0); // Red color for Game Over text
    textAlign(CENTER, CENTER);
    textSize(50);
    // Use the language class to get the correct text
    String gameOverText = language.toSpanishCheck("GAME OVER", spanish);
    text(gameOverText, width / 2, height / 2 - 70);

    // Display the high score
    fill(255); // White color for high score text
    textSize(30);
    String highScoreText = language.toSpanishCheck("HIGH SCORE", spanish) + ": " + highScore;
    text(highScoreText, width / 2, height / 2 - 20);

    // Display the player's score
    String scoreText = language.toSpanishCheck("SCORE", spanish) + ": " + score;
    text(scoreText, width / 2, height / 2 + 10);

    // Update the restart button text in case the language changed
    restartButton.text = language.toSpanishCheck("RESTART", spanish);

    // Draw the restart button
    restartButton.draw();
  }

  /** Method: isRestartButtonClicked()
    * checks if restart button is clicked
    * @return boolean
    */
  public boolean isRestartButtonClicked() {
    return restartButton.overButton();
  }
}
