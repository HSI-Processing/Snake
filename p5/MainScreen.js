/** Class: MainScreen
  * Handles Start Screen display
  */
function MainScreen (language){
  
  // Language
  this.language = language;
  
  // Resize images
  logoENG.resize(815,415);
  logoSPAN.resize(772, 272);

  // Initialize buttons
  this.startButton = new Button(200, 375, 400, 100, this.language.toSpanishCheck("START", spanish));
  this.languageButton = new Button(200, 500, 400, 100, this.language.toSpanishCheck("SPANISH", spanish));
  
  
  /** Method: draw()
    * Displays main Start Screen
    */
  this.draw = function() {
    // Draw Background Logic
    fill(255);
    rect(0, 0, width, height);
    
    background(51);
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(40);

    // Draw logo based on language
    if (spanish) {
      image(logoSPAN, 10, 55);
    } else {
      image(logoENG, 0, -20);
    }

    // Update button texts in case the language changed
    this.startButton.text = this.language.toSpanishCheck("START", spanish);
    this.languageButton.text = this.language.toSpanishCheck("SPANISH", spanish);

    // Draw buttons
    this.startButton.draw();
    this.languageButton.draw();
  }
  
  /** Method: isStartButtonPressed()
    * Checks if start button is clicked
    * @return boolean
    */
  this.isStartButtonPressed = function() {
    return this.startButton.overButton();  
  }

  /** Method: isLanguageButtonPressed()
    * Checks if language button is clicked
    * @return boolean
    */
  this.isLanguageButtonPressed = function() {
    return this.languageButton.overButton();  
  }
}
