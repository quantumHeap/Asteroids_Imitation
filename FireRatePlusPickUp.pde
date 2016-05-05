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
       // triangle(pos.x - halfW/2,pos.y  - halfW, pos.x + halfW,pos.y + halfW,pos.x  - halfW,pos.y + halfW);
       ellipse(pos.x,pos.y,radius,radius);
  }
  void PickedUp(ArrayList<FireRatePlusPickUp> increase_FireRateDrops)
  {
  //    lives += 1;
  //    increase_LivesDrops.remove(this);
  }
}
