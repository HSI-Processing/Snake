/** Class: MainScreen
  * Handles Start Screen display
  */
public class MainScreen {
  // Buttons
  private Button startButton;
  private Button languageButton;
  
  // Logos
  private PImage logoENG;
  private PImage logoSPAN;
  
  // Language
  private Language language;
  
  /** Constructor: MainScreen()
    * Instantiates Language, Buttons, and logos
    * @param language - an instance of Language class for translations
    */
  public MainScreen(Language language) {
    // Language
    this.language = language;
    
    // Load images
    logoENG = loadImage("assets/SnakeLogo_EN.png");
    logoSPAN = loadImage("assets/SnakeLogo_ESP.png");
    logoENG.resize(815,415);
    logoSPAN.resize(772, 272);

    // Initialize buttons
    startButton = new Button(200, 375, 400, 150, language.toSpanishCheck("START", spanish));
    languageButton = new Button(200, 550, 400, 150, language.toSpanishCheck("SPANISH", spanish));
  }
  
  /** Method: draw()
    * Displays main Start Screen
    */
  public void draw() {
    // Draw Background Logic
    fill(255);
    rect(0, 0, width, height);
    
    background(51);
    textMode(CENTER);
    fill(0);
    textSize(40);

    // Draw logo based on language
    if (spanish) {
      image(logoSPAN, 10, 55);
    } else {
      image(logoENG, 0, 15);
    }

    // Update button texts in case the language changed
    startButton.text = language.toSpanishCheck("START", spanish);
    languageButton.text = language.toSpanishCheck("SPANISH", spanish);

    // Draw buttons
    startButton.draw();
    languageButton.draw();
  }
  
  /** Method: isStartButtonPressed()
    * Checks if start button is clicked
    * @return boolean
    */
  boolean isStartButtonPressed() {
    return startButton.overButton();  
  }

  /** Method: isLanguageButtonPressed()
    * Checks if language button is clicked
    * @return boolean
    */
  boolean isLanguageButtonPressed() {
    return languageButton.overButton();  
  }
}
