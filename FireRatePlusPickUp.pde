class FireRatePlusPickUp extends GameObject
{
//float Timer;
  float radius;
   color Blue = color(60,120,214); 

  FireRatePlusPickUp (float x, float y)
  {
    super(x,y);
    Width = 30.0f;
    radius = Width;
  }
  void Update()
  {
  //  Timer++;
  }
  
  void Render()
  {
    fill(Blue);
    ellipse(pos.x,pos.y,radius,radius);
    fill(255);
    float TextSize = 20.0f;
    textSize(TextSize);
    textAlign(CENTER);
    text("FireRate++",pos.x,pos.y);
  }
  void PickedUp(ArrayList<FireRatePlusPickUp> increase_FireRateDrops)
  {
  //    lives += 1;
  //    increase_LivesDrops.remove(this);
  }
}
