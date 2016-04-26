Bullet bullet;
int lives = 3;
int hit = 0;
int destroyedAsteroid = 0;
color Orange = color(198,152,58); 
class BattleShip extends GameObject
{
  BattleShip(float x, float y)
  {
   super(x,y); 
   speed = 5.0f;
  }
  
 int toPass = 60/5;
 int ellapsed = toPass;

  void Update()
  {
   forward.x = sin(theta);
   forward.y = - cos(theta);
   velocity.x = forward.x;
   velocity.y = forward.y;
   velocity.mult(speed);
   LifeSystem();
   ChechForCollisionWithAsteroid(asteroids);
   
    if(keys[' '] && ellapsed > toPass)
    {
      PVector bulletPos = pos.get(); //get ships position
      bulletPos.add(PVector.mult(forward,30)); // where the bullet will be fired from
      Bullet b = new Bullet(bulletPos.x, bulletPos.y, theta); // create an instance of the bullet 
      bullets.add(b); // add the created bullet to the bullets array
      ellapsed = 0;
    }
    /*
    if((pos.x < 0) || (pos.x > width) || (pos.y < 0) || (pos.y > height))
    {
       bullets.remove(this);
    }
    */
    ellapsed ++;
    
   if(keys[UP])
    {
      pos.add(velocity); 
    }
   if (keys[LEFT])
    {
      theta -= 0.1f;
    }
    if (keys[RIGHT])
    {
      theta += 0.1f;
    }      
    
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
  void Render()
  {
    stroke(255);
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate
    triangle(0, -halfW, halfW, halfW, - halfW, halfW);
/*    
    line(- halfW, halfW, 0, - halfW);
    line(0, - halfW, halfW, halfW);
    line(halfW, halfW, 0, 0);
    line(- halfW, halfW, 0, 0);
    */
    popMatrix();
  }
    void LifeSystem()
  {
    textSize(25);
    fill(Orange);
    text("Life's = " + lives,width - width/1.1f,height - height/12);
    
  }
    boolean ChechForCollisionBetweenAsteroidAndBullet(ArrayList<Asteroid> asteroids,ArrayList<Bullet> bullets)
    {
      for(Asteroid a : asteroids)
      for(Bullet b : bullets)
      {
       PVector dist = PVector.sub(b.pos,a.pos); 
       if(dist.mag() <  a.radius)
       {
         destroyedAsteroid += 1;
         
         if(destroyedAsteroid >= 5);
         {
           gameObjects.add(new Increase_Lives_PowerUp(random(width,height),random(width,height)));
         }
       }
       return true;
      }
      return false;
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
        hit+=1;
        if(hit == 3)
        {
          lives-=1;
          pos.x = width/2;
          pos.y = height/2;
          hit = 0; 
        }
        return true; 
      }
    }
    return false;
  }
}
