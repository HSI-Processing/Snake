public class Apple
{
  int x, y;
  
  public Apple(Serpent serpent)
  {
    spawnApple(serpent);
  }
  
  public void drawMe()
  {
    fill(255,100,100);
    square(x, y, 20);
  }
  
  public void spawnApple(Serpent serpent)
  {
    boolean isOccupied;
    do
    {
      isOccupied = false;
      
      x = (int)random(width/20) * 20;
      y = (int)random(height/20) * 20;
      
      if (x == serpent.x && y == serpent.y)
      {
        isOccupied = true;
      }
      for (Segment part : serpent.segments)
      {
        if (x == part.x && y == part.y)
        {
          isOccupied = true;
        }
      }
    }
    while (isOccupied);
  }
}
