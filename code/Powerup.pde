public class Powerup{

  Snake snake = new Snake();
  int timer = millis();
  
  public Powerup(){
    float counter = 20;
    if(countdown(counter)){
      frameRate(10);
      updateScore();
    }else{
      frameRate(20);
    }
    
  }


  public void updateScore(){
    snake.score += 3;
  }
  
  public boolean countdown(float counter){
    if(millis() - timer > 1000){
      counter--;
      timer = millis();
    }
    if(counter > 0){
      return true;
    }
      return false;
  }

}
