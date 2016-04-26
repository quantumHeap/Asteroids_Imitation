class Increase_Lives_PowerUp extends GameObject
{
  float Timer;
  
  Increase_Lives_PowerUp(float x, float y)
  {
    super(x,y);
    Width = 30.0f;
  }
  void Update()
  {
    Timer++;
  }
  void Render()
  {
        triangle(0, -halfW, halfW, halfW, - halfW, halfW);
  }
}
