class GameObject
{
  // Position, forward vector, rotation, width,height,speed, color.
  PVector pos;
  PVector forward;
  PVector velocity;
  PVector rotation;
  float theta;
  float Width;
  float halfW;
  float Height;
  float speed;
  float maxSpeed;
  color c;
 
  GameObject(float x, float y) // Maybe go 3D float z
  {
    pos = new PVector(x,y); 
    forward = new PVector(0,-1);
    velocity = new PVector(0,0);
   // speed = 5.0f;
    theta = 0.0f;
    Width = 50.0f;
    Height = 50.0f;
    halfW = Width/2;
  }
  public void Update()
  {
    
  }
  public void Render()
  {
    
  }
}
