class Increase_Lives_PowerUp extends GameObject
{
//float Timer;
  float radius;
   color Green = color(72,211,60); 

  Increase_Lives_PowerUp(float x, float y)
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
        fill(Green);
       // triangle(pos.x - halfW/2,pos.y  - halfW, pos.x + halfW,pos.y + halfW,pos.x  - halfW,pos.y + halfW);
       ellipse(pos.x,pos.y,radius,radius);
  }
  void PickedUp(ArrayList<Increase_Lives_PowerUp> increase_LivesDrops)
  {
  //    lives += 1;
  //    increase_LivesDrops.remove(this);
  }
}
