class Bullet extends GameObject
{
  Bullet(float x, float y, float theta)
  {
   super(x,y);
   this.theta = theta;
   speed = 0.0f;
   maxSpeed = 15.0f;
   Width = 30.0f;
   Height = 30.0f;
  }

  void Update()
  {
   forward.x = sin(theta);
   forward.y = - cos(theta);
   velocity.x = forward.x;
   velocity.y = forward.y;
   velocity.mult(speed);
   pos.add(velocity); 
   ChechForCollisionWithAsteroid( asteroids);
   if(speed < maxSpeed)
   {
    speed++; 
   }
       if ((pos.x < 0) || (pos.x > width) || (pos.y < 0) || (pos.y > height))
    {
      bullets.remove(this);
    } 
    //Will be a power-Up
    /*
    if (pos.x < 0)
    {
      pos.x = width;
    }
      if (pos.x > width)
    {
      pos.x = 0;
    }
    
    if (pos.y < 0)
    {
      pos.y = height;
    }
    
    if (pos.y > height)
    {
      pos.y = 0;
    }
    */
}
  void Render()
  {
    
     stroke(255);
     fill(255);
     pushMatrix();
     translate(pos.x,pos.y);
     rotate(theta);;
    line(0,halfW,0, - halfW);
     popMatrix();
  }
  boolean ChechForCollisionWithAsteroid(ArrayList<Asteroid> asteroids)
  {
    for( Asteroid a : asteroids)
    {
      PVector dist = PVector.sub(pos, a.pos);
      
      if(dist.mag() < a.radius)
      {
       // a.radius = 20.0f;
        a.breakUp(asteroids);
        bullets.remove(this);
        return true; 
      }
    }
   
    return false;
  }
  
}
