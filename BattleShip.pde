Bullet bullet;
Ship_ParticleSystem Sps;

class BattleShip extends GameObject
{
  BattleShip(float x, float y)
  {
   super(x,y); 
   OriginalPosX = pos.x;
   OriginalPosY = pos.y;
   speed = 5.0f;
   radius = Width;
   Sps = new Ship_ParticleSystem(new PVector(pos.x,pos.y));
  }
  
 int lives;
 int hit = 0;
 int destroyedAsteroid = 0;
 color Orange = color(198,152,58); 
 float OriginalPosX;
 float OriginalPosY; 
 int FireRate = 60/5;
 int coolDown = FireRate;
 boolean Explode;
 float radius;
 void setup()
 {
   lives = 3;
 }
  void Update()
  {
   forward.x = sin(theta);

   forward.y = - cos(theta);
   velocity.x = forward.x;
   velocity.y = forward.y;
   velocity.mult(speed);
   InputMovement();
   CheckForCollisionWithAsteroid(asteroids);
   HasBeenHit();
   LifeSystem();
   coolDown ++;
    
  if(lives == 0)
  {
    Lvl = false;
    OnMainMenu = true;
    lives +=3;
    Score = 0;
  }
  } 
  
  void InputMovement()
  {
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
      if(keys[' '] && coolDown >= FireRate)
    {
      PVector bulletPos = pos.get(); //get ships position
      bulletPos.add(PVector.mult(forward,30)); // where the bullet will be fired from after taking the forward vector of the battleship
      Bullet b = new Bullet(bulletPos.x, bulletPos.y, theta); // create an instance of the bullet 
      bullets.add(b); // add the created bullet to the bullets array
      coolDown = 0;
      LaserBeam.rewind();
      LaserBeam.play();
    }
  }
   void HasBeenHit()
  {
      if(hit == 1)
     {
       float lifespan = 50;
        Sps.addParticle(pos,lifespan);
        Sps.run();   
     }
     if(hit == 2)
     {
       float lifespan = 100;
        Sps.addParticle(pos,lifespan);
        Sps.run();   
     }
       if(hit == 3)
     {
       float lifespan = 200;
        Sps.addParticle(pos,lifespan);
        Sps.run();  
     }
  }
  void Render()
  {
    stroke(255);
    fill(Orange);
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
    rotate(theta); //  rotate should happen first, so  make the call AFTER translate
    triangle(0, -halfW, halfW, halfW, - halfW, halfW);
    popMatrix();
  }
    void LifeSystem()
  {
    textSize(25);
    fill(Orange);
    text("Life's = " + lives,width - width/1.1f,height - height/12);
  }
  
  boolean CheckForCollisionWithLifePowerUp(ArrayList<Increase_Lives_PowerUp> increase_LivesDrops)
  {
    for(Increase_Lives_PowerUp livesplus1 : increase_LivesDrops)
    {
   //  PVector dist =  PVector.sub(new PVector(pos.x + radius, pos.y + radius), new PVector(livesplus1.pos.x + livesplus1.radius,livesplus1.pos.y + livesplus1.radius));
       PVector dist = PVector.sub(pos, livesplus1.pos);
       
     if(dist.mag() < livesplus1.radius)
     {
         livesplus1.PickedUp();
     }
     return true;  
    }
    return false;
  }
  
    boolean CheckForCollisionWithAsteroid(ArrayList<Asteroid> asteroids)
  {
    for( Asteroid a : asteroids)
    {
      PVector dist = PVector.sub(pos, a.pos);
      
      if(dist.mag() < a.radius)
      {
        a.breakUp(asteroids);
      if(a.step == 0)
      {
       hit +=3; 
      }
      if(a.step == 1)
      {
       hit +=2; 
      }
      if(a.step == 2)
      {
       hit +=1; 
      }
      if(hit >= 3)
      {
          Explode = true;
          lives-=1;
          pos.x = OriginalPosX;
          pos.y = OriginalPosY;
          hit = 0; 
      }
        return true; 
     }
   }
     return false;
  }

}
