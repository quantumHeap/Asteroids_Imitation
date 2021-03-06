class Bullet extends GameObject
{
  Bullet(float x, float y, float theta)
  {
   super(x,y);
   this.theta = theta;
   maxSpeed = 15.0f;
   speed = maxSpeed;
   Width = 30.0f;
   Height = 30.0f;
  }

  float dampSpeed = 0.2f;
  color Green = color(93,250,63); 

  void Update()
  {
   forward.x = sin(theta);
   forward.y = - cos(theta);
   velocity.x = forward.x;
   velocity.y = forward.y;
   velocity.mult(speed);
   pos.add(velocity); 
   ChechForCollisionWithAsteroid( asteroids);
   BulletDeccelleration();
}

 void BulletDeccelleration()
  {

     if(speed > 0)
     {
      speed -= dampSpeed; 
     }
     
     if(speed <= 0.1f)
     {
           bullets.remove(this);
     }
     if(PickedUpBulletWrapBuff == false)
     {
        if ((pos.x < 0) || (pos.x > width) || (pos.y < 0) || (pos.y > height))
          {
            bullets.remove(this);
          } 
     }
      if(PickedUpBulletWrapBuff == true)
      {
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
      }
  }
  void Render()
  {
     stroke(Green);
     fill(Green);
     pushMatrix();
     translate(pos.x,pos.y);
     rotate(theta);;
     line(0,halfW,0, - halfW);
     popMatrix();
  }
 public boolean ChechForCollisionWithAsteroid(ArrayList<Asteroid> asteroids)
  {
    for( Asteroid a : asteroids)
    {
      PVector dist = PVector.sub(pos, a.pos);
      
      if(dist.mag() < a.radius)
      {
        a.breakUp(asteroids);
        bullets.remove(this);
        return true; 
      }
    }
    return false;
  }
}
