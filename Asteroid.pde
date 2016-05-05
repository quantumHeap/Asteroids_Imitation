Asteroid_ParticleSystem Aps;
class Asteroid extends GameObject
{
  float radius;
  int step;
  boolean hit;
   Asteroid(float x, float y, int Step)
  {
     super(x,y);
     
     step = Step;
     speed = 1.0f;
     Width = width/13;
     radius = Width;
     Aps = new Asteroid_ParticleSystem(new PVector(pos.x,pos.y));
     
    if(step == 0)
    {
      radius = Width;
     
    }
    if(step == 1)
    {  
      radius = Width/2;
      speed *= 1.5f;
    }
     if(step == 2)
    {
      radius = Width/3;
      speed *= 2.0f;
    }
    
     float angle = random(2 * PI);
     velocity = new PVector(cos(angle) * speed, sin(angle) * speed);
     
  } 
  
  void Update()
  {
     pos.add(velocity);
     Aps.run();
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
    fill(125);
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
  //  rect(-halfW, -Width, 50, 10);
    ellipse(0,0,radius,radius);
  //  rect(-halfW, -Width, 50 * ((float)Health / (float)MaxHealth), 10);
    rotate(theta); //  rotate should happen first, so you make the call AFTER translate    
    popMatrix();
  } 
  
  void breakUp(ArrayList<Asteroid> asteroids)
  {
     hit = true;
     if(step == 0 )
     {  
       for(int i = 0; i < 3; i++)
       {
        float angle = random(2 * PI);
        PVector randRot = new PVector(radius * sin(angle), radius * cos(angle));
        asteroids.add(new Asteroid(pos.x ,pos.y,1));
       }
    //   float lifeSpan = 20.0f;
    //   Aps.addParticle(pos,lifeSpan);
       asteroids.remove(this);
       Score += 100;
       Explosion_Large.rewind();
       Explosion_Large.play();
     }
      if(step == 1)
      {
         for(int i = 0; i < 3; i++)
         {
          float angle = random(2 * PI);
          PVector randRot = new PVector(radius * sin(angle), radius * cos(angle));
          asteroids.add(new Asteroid(pos.x ,pos.y,2));
         }
     //    float lifeSpan = 20.0f;
     //    Aps.addParticle(pos,lifeSpan);
         asteroids.remove(this);
         Score+= 200;

         Explosion_Medium.rewind();
         Explosion_Medium.play();
      }
       if(step == 2)
      {
     //    float lifeSpan = 20.0f;
   //      Aps.addParticle(pos,lifeSpan);
         asteroids.remove(this);
         Score+= 400;
         Explosion_Small.rewind();
         Explosion_Small.play();
      }
      
      if(Score >= 1000 && createdLifeDrop == false)
      {
        increase_LivesDrops.add(new Increase_Lives_PowerUp(pos.x,pos.y)); 
        createdLifeDrop = true;
      }
         if(Score >= 5000 && createdFireRateDrop == false)
      {
        increase_FireRateDrops.add(new FireRatePlusPickUp(pos.x,pos.y)); 
        createdFireRateDrop= true;
      }
         if(Score >= 10000 && createdBulletWrapDrop == false)
      {
        BulletWrapDrops.add(new BulletWrapPickUp(pos.x,pos.y)); 
        createdBulletWrapDrop = true;
      }
  }
}
