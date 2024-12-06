// Game Objects //<>//
let serpent;
let apple;
let powerUp;

// Screen Objects
let startScreen;
let gameOverScreen;
let language = new Language();

// Booleans
let spanish = false;
let isDead = false;
let start;

// Variables
let score = 0;
let highScore = 0;
let applesEaten = 0;
let powerUpDuration = 0;

// Preload images
function preload() {
    logoENG = loadImage("SnakeLogo_EN.png");
    logoSPAN = loadImage("SnakeLogo_ESP.png");
}

/** Method: setup()
  * Sets up the basic game environment
  */
function setup() {
    let canvas = createCanvas(800, 640);
    reset();
    noStroke();
    frameRate(16);

    // Creates an HTML div to apply CSS style to the canvas
    let gameContainer = createDiv();
    gameContainer.id("game-container");
    gameContainer.child(canvas);
}

/** Method: draw()
  * Handles game displays and mechanics
  */
function draw() {
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
function reset() {
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
function displayMain() {
    if (startScreen == null) {
        startScreen = new MainScreen(language);
    }
    startScreen.draw();
}

/** Method: statBoard()
  * Displays stat board during gameplay
  */
function statBoard() {
    fill(34, 167, 59);
    textAlign(LEFT);
    text(language.toSpanishCheck("SCORE", spanish) + ": " + score, 5, 30);
    text(language.toSpanishCheck("HIGH SCORE", spanish) + ": " + highScore, 5, 60);
}

/** Method: keyPressed()
  * Handles logic for gameplay key-binds
  */
function keyPressed() {
    if (keyCode === UP_ARROW && !serpent.isMoveY) {
        serpent.speedY = -20;
        serpent.speedX = 0;
    } else if (keyCode === DOWN_ARROW && !serpent.isMoveY) {
        serpent.speedY = 20;
        serpent.speedX = 0;
    } else if (keyCode === LEFT_ARROW && !serpent.isMoveX) {
        serpent.speedX = -20;
        serpent.speedY = 0;
    } else if (keyCode === RIGHT_ARROW && !serpent.isMoveX) {
        serpent.speedX = 20;
        serpent.speedY = 0;
    } 
}

/** Method: mouseClicked()
  * Handles mouse clicks for buttons
  */
function mouseClicked() {
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
