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
    ellipse(pos.x,pos.y,radius,radius);
    fill(255);
    float TextSize = 20.0f;
    textSize(TextSize);
    textAlign(CENTER);
    text("Life+1",pos.x,pos.y);
  }
  void PickedUp(ArrayList<Increase_Lives_PowerUp> increase_LivesDrops)
  {
  //    lives += 1;
  //    increase_LivesDrops.remove(this);
  }
}
