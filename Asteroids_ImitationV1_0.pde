// Need to finish  battleship Particles
//Need to finish power-upDrops
//Need to finish Asteroid Particles, explosion of particles outwards in all directions
//when battleship is destroyed explosion of particles outwards 
//need to create end game menu that loops back to the start
// need to create spawner for asteroids that ramps up the creation of asteroids overtime (neverending rounds + lasting pwer-ups buffs == awesomeness 
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//BattleShip battleShip;
//Asteroid asteroid;
//Bullet bullet1;

boolean[] keys = new boolean[512];
ArrayList<BattleShip> battleShips;
ArrayList<Bullet> bullets;
ArrayList<Asteroid> asteroids;
//ArrayList<Increase_Lives_PowerUp> increase_LivesDrops;
//int increase_LivesDropAmount;
int BattleShipAmount;
int AsteroidAmount;  ////////////// need asteroid amount to be able to vary when wanted.//////////////
boolean OnMainMenu;
boolean Lvl;
int Score;
int CreateAsteroidTime;
int AsteroidCreationTimeCoolDown;
boolean createdLifeDrop;
Minim minim; 
AudioPlayer LaserBeam;
AudioPlayer Explosion_Large;
AudioPlayer Explosion_Medium;
AudioPlayer Explosion_Small;

void setup()
{
  size(750,750);
   minim = new Minim(this);
   LaserBeam = minim.loadFile("LaserFired.mp3");
   Explosion_Large = minim.loadFile("Explosion_Large.mp3");
   Explosion_Medium = minim.loadFile("Explosion_Medium.mp3");
   Explosion_Small = minim.loadFile("Explosion_Small.mp3");
   LaserBeam.setGain(-30);
   BattleShipAmount = 1;
   AsteroidAmount = 10;
  battleShips = new ArrayList<BattleShip>();
  asteroids = new ArrayList<Asteroid>();
  CreateAsteroidTime = 60 * 5;
  
//  createdLifeDrop = false;

  for(int i = 0; i < BattleShipAmount; i++)
  {
    battleShips.add(new BattleShip(width/2,height/2));
  }
  for(int i = 0; i < AsteroidAmount; i++)
  {
      asteroids.add(new Asteroid(random(width,height),random(width,height),0));
  }
  bullets = new ArrayList<Bullet>();
  OnMainMenu = true;
}

void keyPressed()
{
 keys[keyCode] = true; 

}

void keyReleased()
{
 keys[keyCode] = false; 
}

void draw()
{
  background(125);

  if(OnMainMenu == true)
   {  
    Lvl = false;
    float AsteroidsHeadingSize = 75.0f;
    float TitleSize = 50.0f;
    float gap = 30.0f;
    textSize(TitleSize);
    textAlign(CENTER);
    text("Asteroids",width/2,height/2 -  TitleSize *4);
    text("MainMenu",width/2,height/2 -  TitleSize *2);
    float ExplanationTextSize = 20;
    textSize(ExplanationTextSize);
    text("large Asteroid Collision kills outright",width/2 ,height/2 - gap);
    text("Medium Asteroid Collision is worth 2 hits",width/2 ,height/2);
    text("Small Asteroid Collision is worth 1 hit",width/2 ,height/2 + gap);
    text("you can be hit 3 times each life",width/2 ,height/2 + gap * 2);
    text("you have 3 lives",width/2 ,height/2 + gap * 3);
    textSize(TitleSize);
    text("Power-Ups",width/2,height/2 + gap * 5);
    textSize(ExplanationTextSize);
    text("Increase rate of fire",width/2,height/2 + gap * 6);
    text("Add +1 lives",width/2,height/2 + gap * 7);
    text("Bullet-Wrap",width/2,height/2 + gap * 8);
    text("Arrow keys to Move, space Key to fire",width/2,height/2 + gap * 9);
    text("Click anywhere to begin",width/2,height/2 + gap * 10);
    //I wanted to add movement on the main menu with this as the player read through the instructions
   /*
      for(int i = 0; i < asteroids.size(); i ++)
    {
      Asteroid a = asteroids.get(i);
      a.Render();
      a.Update(); 
    }
  */  
   if(((mouseX >= 0)
   &&(mouseX <= width)
   &&(mouseY >= 0)
   &&(mouseY <= height))
   &&(mousePressed && mouseButton == LEFT))
   {
     OnMainMenu = false;
     Lvl = true;
     AsteroidCreationTimeCoolDown = 0;
   }
  }
  
  if(Lvl == true)
   {
    text("Score = " + Score,100,100);
    for(int i = 0; i < battleShips.size(); i++)
    {
      BattleShip ship = battleShips.get(i);
      ship.Render();
      ship.Update();
    }
    for(int i = 0; i < asteroids.size(); i ++)
    {
      Asteroid a = asteroids.get(i);
      a.Render();
      a.Update(); 
    }
    /*
    if(increase_LivesDropAmount > 0)
    {
        for(int i = 0; i <= increase_LivesDrops.size(); i++)
        {
          Increase_Lives_PowerUp LifesPlus = increase_LivesDrops.get(i);
          LifesPlus.Update();
          LifesPlus.Render();
        }
    }
   */
    for(int i = bullets.size() -1 ; i >= 0  ; i --)
    {
      Bullet b = bullets.get(i);
      b.Update();
      b.Render(); 
      
       if(b.ChechForCollisionWithAsteroid(asteroids) == true)
       {
       Score +=1;
       }
    }
    
    if(Score >= 5 && createdLifeDrop == false)
    {
     // increase_LivesDrops.add(new Increase_Lives_PowerUp(random(width,height),random(width,height)));
  //    createdLifeDrop = true;
  //    increase_LivesDropAmount +=1;
     
    }
    if(AsteroidCreationTimeCoolDown >= CreateAsteroidTime)
    {
       asteroids.add(new Asteroid(random(width,height),random(width,height),0));
       AsteroidCreationTimeCoolDown = 0;
    }
    AsteroidCreationTimeCoolDown ++;
  }  
}
