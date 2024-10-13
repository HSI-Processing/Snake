public MainScreen startScreen;
public Language language = new Language();
boolean spanish = false;
boolean isBeginning;

Serpent serpent;
Apple apple;
boolean isDead;
int score;

public void setup() 
{
  size(800, 800);
  reset();
  noStroke(); //<>//
  frameRate(20);
}

public void draw() 
{ 
  background(51);
  if (!isDead)
  {
    isDead = serpent.isDead();
  }
  
  apple.drawMe();
  serpent.drawMe();
  serpent.slither();
  
  if (serpent.eat(apple))
  {
    score += 3;
    apple.spawnApple(serpent);
  } //<>//
  
  displayInstruction();
}

public void reset()
{
  score = 0;
  serpent = new Serpent();
  apple = new Apple(serpent);
  isDead = false;
  isBeginning = true;
}

public void keyPressed() 
{ 
  if (key == TAB || key == ENTER)
  {
    reset();
  }
  if (key==CODED) 
  {
    if (keyCode==UP && !serpent.isMoveY) 
    {
      serpent.speedY = -20;
      serpent.speedX = 0;
    }
    if (keyCode==DOWN && !serpent.isMoveY) 
    {
      serpent.speedY = 20;
      serpent.speedX = 0;
    }
    if (keyCode==LEFT && !serpent.isMoveX) 
    {
      serpent.speedX = -20;
      serpent.speedY = 0;
    }
    if (keyCode==RIGHT && !serpent.isMoveX) 
    {
      serpent.speedX = 20;
      serpent.speedY = 0;
    }
  }
}

public void displayMain(){
  startScreen = new MainScreen();
  startScreen.languageButton(200, 550, 400, 150, language.toSpanishCheck("SPANISH"));
  startScreen.startButton(200, 375, 400, 150, language.toSpanishCheck("START"));
}

public void displayInstruction()
{
  if (isDead)
  {
    textAlign(CENTER);
    text(language.toSpanishCheck("GAME OVER"), width/2, (height/2)-75);
    text(language.toSpanishCheck("Score: ") + score, width/2, (height/2)-25);
    text(language.toSpanishCheck("Press TAB or ENTER to restart"), width/2, (height/2)+25);
  }
  else
  {
    textAlign(LEFT);
    text(language.toSpanishCheck("Score: ") + score, 10, 35);
  }
  
  if (isBeginning){
    textAlign(CENTER);
    displayMain();
  }
}

public void mouseClicked(){
  if(isBeginning){
    if (startScreen.isStartButtonPressed()) {
      isBeginning = false;
    }else if(startScreen.isLanguageButtonPressed()) {
      spanish = !spanish;
      
      if (spanish){
        spanish = true;
      }else{
        spanish = false;
      }
    }
  }  
}
