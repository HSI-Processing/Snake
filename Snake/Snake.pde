// Game Objects //<>//
private Serpent serpent;
private Apple apple;
private PowerUp powerUp;

// Screen Objects
public MainScreen startScreen;
public GameOver gameOverScreen;
public Language language = new Language();

// Booleans
private boolean spanish = false;
private boolean isDead = false;
private boolean start;

// Variables
private int score = 0;
private int highScore = 0;
private int applesEaten = 0;
private int powerUpDuration = 0;

/** Method: setup()
  * Sets up the basic game environment
  */
public void setup() {
    size(800, 800);
    reset();
    noStroke();
    frameRate(16);
}

/** Method: draw()
  * Handles game displays and mechanics
  */
public void draw() {
    background(51);

    if (!start && !isDead) {
        displayMain();
    } else if (isDead) {
        if (gameOverScreen == null) {
            gameOverScreen = new GameOver(language);
        }
        gameOverScreen.draw();
    } else if (start && !isDead) {
        isDead = serpent.isDead();

        apple.drawMe();
        serpent.drawMe();
        serpent.slither();

        if (serpent.eat(apple)) {
            score += 3;
            applesEaten++;
            apple.spawnApple(serpent);

            if (applesEaten % 3 == 0) {
                powerUp.spawnPowerUp(serpent);
            }
        }

        powerUp.drawMe();
        if (powerUp.isActive && serpent.eatPowerUp(powerUp)) {
            powerUp.isActive = false;
            score += 6;
            serpent.serpentLength += 6;
            frameRate(8);
            powerUpDuration = 50;
        }

        if (powerUpDuration > 0) {
            powerUpDuration--;
            if (powerUpDuration == 0) {
                frameRate(16);
            }
        }

        statBoard();

        if (score > highScore) {
            highScore = score;
        }
    }
}

/** Method: reset()
  * Resets all game functions
  */
public void reset() {
    // Instantiate game objects
    serpent = new Serpent();
    apple = new Apple(serpent);
    powerUp = new PowerUp();
    
    // Reset stats
    score = 0;
    applesEaten = 0;
    isDead = false;
    start = false;
    frameRate(16);
    powerUpDuration = 0;
}

/** Method: displayMain()
  * Displays the main Start Screen
  */
public void displayMain() {
    if (startScreen == null) {
        startScreen = new MainScreen(language);
    }
    startScreen.draw();
}

/** Method: statBoard()
  * Displays stat board during gameplay
  */
public void statBoard() {
    fill(34, 167, 59);
    textAlign(LEFT);
    text(language.toSpanishCheck("SCORE", spanish) + ": " + score, 5, 30);
    text(language.toSpanishCheck("HIGH SCORE", spanish) + ": " + highScore, 5, 60);
}

/** Method: keyPressed()
  * Handles logic for gameplay key-binds
  */
public void keyPressed() {
    if (key == CODED) {
        if (keyCode == UP && !serpent.isMoveY) {
            serpent.speedY = -20;
            serpent.speedX = 0;
        } else if (keyCode == DOWN && !serpent.isMoveY) {
            serpent.speedY = 20;
            serpent.speedX = 0;
        } else if (keyCode == LEFT && !serpent.isMoveX) {
            serpent.speedX = -20;
            serpent.speedY = 0;
        } else if (keyCode == RIGHT && !serpent.isMoveX) {
            serpent.speedX = 20;
            serpent.speedY = 0;
        }
    } else if (isDead) {
        reset();
        gameOverScreen = null;  // Return to main menu
        startScreen = null;      // Reset startScreen to ensure main menu displays correctly
    }
}

/** Method: mouseClicked()
  * Handles mouse clicks for buttons
  */
public void mouseClicked() {
    if (!start && !isDead) {
        if (startScreen == null) {
            startScreen = new MainScreen(language);
        }

        if (startScreen.isStartButtonPressed()) {
            start = true;
        } else if (startScreen.isLanguageButtonPressed()) {
            spanish = !spanish;
            startScreen = null;
        }
    } else if (isDead) {
        if (gameOverScreen.isRestartButtonClicked()) {
            reset();
            gameOverScreen = null;  // Return to main menu
            startScreen = null;      // Reset startScreen to ensure main menu displays correctly
        }
    }
}
