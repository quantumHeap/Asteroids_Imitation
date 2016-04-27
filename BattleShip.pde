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
   Sps = new Ship_ParticleSystem(new PVector(pos.x,pos.y));
  }
  
 int lives = 3;
 int hit = 0;
 int destroyedAsteroid = 0;
 color Orange = color(198,152,58); 
 float OriginalPosX;
 float OriginalPosY; 
 int FireRate = 60/5;
 int coolDown = FireRate;
 boolean Explode;
 
  void Update()
  {
   forward.x = sin(theta);
   forward.y = - cos(theta);
   velocity.x = forward.x;
   velocity.y = forward.y;
   velocity.mult(speed);
   InputMovement();
   ChechForCollisionWithAsteroid(asteroids);
   HasBeenHit();
   LifeSystem();
 //ChechForCollisionBetweenAsteroidAndBullet(asteroids,bullets);
    coolDown ++;
    
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
      bulletPos.add(PVector.mult(forward,30)); // where the bullet will be fired from
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
  /*
  // I could just call to see if the bool check of the collision with the asteroid in bullet == true but how?  
    //////////////// Score system and Power-up drops are dependent on this check, Need to  fix it ///////////////////////////// 
    boolean ChechForCollisionBetweenAsteroidAndBullet(ArrayList<Asteroid> asteroids,ArrayList<Bullet> bullets)
    {
      for(Asteroid a : asteroids)
      for(Bullet b : bullets)
      {
       //for(int i = 0; i < a.size(); i++)
    //     {
    //      for(int j = 0; j < b.length(); j++)
    //       {
       PVector dist = PVector.sub(b.pos,a.pos); 
       
       if(dist.mag() <  a.radius)
       {
         destroyedAsteroid += 1; //Counter for the power-Ups
         
         if(destroyedAsteroid == 5);
         {
           gameObjects.add(new Increase_Lives_PowerUp(random(width,height),random(width,height)));
         }
       }
       return true;
      }
      return false;
    }
    */
    boolean ChechForCollisionWithAsteroid(ArrayList<Asteroid> asteroids)
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
  /*
   boolean ChechForCollisionWithLifeBuff(Increase_Lives_PowerUp)
  {
  
      PVector dist = PVector.sub(pos, Increase_Lives_PowerUp.pos);
      
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
  */
}
