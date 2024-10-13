public class Serpent
{
  int x, y;
  int speedX, speedY;
  int serpentLength;
  boolean isMoveX, isMoveY;
  ArrayList<Segment> segments = new ArrayList();
  
  public Serpent()
  {
    x = width/2;
    y = height/2;
    speedX = 0;
    speedY = 0;
    serpentLength = 3;
  }
  
  public void drawMe()
  {
    // Draw the body segments
    fill(100,255,100);
    for (Segment part : segments)
    {
      square(part.x, part.y, 20);
    }
    
    // Draw the head of the serpent
    fill(197,139,231); // serpent head color - purple
    square(x, y, 20);
  }
  
  public boolean eat(Apple apple)
  {
    if(apple.x == x && apple.y == y)
    {
      serpentLength += 3;
      return true;
    }
    else
    {
      return false;
    }
  }
  
  public boolean isDead()
  {
    if (x < 0 || x >= width || y < 0 || y >= height)
    {
      kill();
      return true;
    }
    else
    {
      for (Segment part : segments)
      {
        if (part.x == x && part.y == y)
        {
          kill();
          return true;
        }
      }
    }
    return false;
  }
  
  public void kill()
  {
    serpentLength = 0;
    for (int i=segments.size()-1; i >= 0; i--)
    {
      segments.remove(i);
    }
    speedX = 0;
    speedY = 0;
    x = 20000;
  }
  
  public void slither()
  {
    if (speedX != 0 || speedY != 0)
    {
      if (segments.size() < serpentLength)
      {
        segments.add(new Segment(x, y));
      }
      else
      {
        for (int i=0; i < segments.size() - 1; i++)
        {
          Segment back = segments.get(i);
          Segment front = segments.get(i + 1);
          back.x = front.x;
          back.y = front.y;
        }
        
        if (segments.size() != 0)
        {
          Segment back = segments.get(segments.size() - 1);
          back.x = x;
          back.y = y;
        }
      }
      
      if (speedX != 0)
      {
        x += speedX;
        isMoveX = true;
        isMoveY = false;
      }
      else if (speedY != 0)
      {
        y += speedY;
        isMoveX = false;
        isMoveY = true;
      }
    }
  }
}
