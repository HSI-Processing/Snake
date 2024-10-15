public class PowerFruit
{
  int x, y;
  
  public PowerFruit(Serpent serpent)
  {
    spawnFruit(serpent);
  }
  
  public void drawMe()
  {
    fill(255);
    square(x, y, 20);
  }
  
  public void spawnFruit(Serpent serpent)
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
