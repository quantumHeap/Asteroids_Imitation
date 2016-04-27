Asteroid_ParticleSystem Aps;
class Asteroid extends GameObject
{
  int MaxHealth = 100;
  int Health;
  float radius;
  int step;
  
   Asteroid(float x, float y, int Step)
  {
     super(x,y);
     step = Step;
     speed = 1.0f;
 //    theta = theta;
 //    Health = MaxHealth;
     Width = width/13;
     radius = Width;
     Aps = new Asteroid_ParticleSystem(new PVector(pos.x,pos.y));
     
       if(step == 0)
      {
         radius = Width;
         // Aps = new Asteroid_ParticleSystem(new PVector(pos.x,pos.y));
         //Aps.addParticle();
         //Aps.run();   
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
 //    rotation = new PVector(cos(angle), sin(angle));
  //   rotation = new PVector(0,-1);

     
  } 
  void Update()
  {
     //Aps.addParticle();
   //  ps.run();  
   //  forward.x = sin(theta);
    // forward.y = - cos(theta);
     pos.add(velocity);
     //pos.add(forward);
  //   radius -= 0.5f;
    // if(radius <= 40)
   //  {
  //     breakUp(asteroids);
  //   }
     
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
    
   // fill(0, 255, 0);
   // stroke(0, 255, 0);
    rect(-halfW, -Width, 50, 10);
    ellipse(0,0,radius,radius);
  //  fill(255, 0, 0);
  //  stroke(255, 0, 0);
    rect(-halfW, -Width, 50 * ((float)Health / (float)MaxHealth), 10);
    
 //   stroke(255);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate    
    popMatrix();
  }  
  void breakUp(ArrayList<Asteroid> asteroids)
  {
    /*
     if(radius <= 25)
     {
       gameObjects.remove(this);
     }
     else if(radius  > 25 && radius < 40)
     {
       
     }
     */ 
     if(step == 0 )
     {
       for(int i = 0; i < 3; i++)
       {
        float angle = random(2 * PI);
        PVector randRot = new PVector(radius * sin(angle), radius * cos(angle));
        asteroids.add(new Asteroid(pos.x ,pos.y,1));
       }
       asteroids.remove(this);
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
          Explosion_Medium.rewind();
          Explosion_Medium.play();
         }
         asteroids.remove(this);
      }
       if(step == 2)
      {
         asteroids.remove(this);
         Explosion_Small.rewind();
         Explosion_Small.play();
      }

  }
}
