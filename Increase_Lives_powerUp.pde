class Increase_Lives_PowerUp extends GameObject
{
  float Timer;
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
    Timer++;
  }
  
  void Render()
  {
        fill(Green);
        triangle(pos.x - halfW/2,pos.y  - halfW, pos.x + halfW,pos.y + halfW,pos.x  - halfW,pos.y + halfW);
  }
}
