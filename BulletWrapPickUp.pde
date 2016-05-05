class BulletWrapPickUp extends GameObject
{
//float Timer;
  float radius;
   color Purple = color(208,53,211); 

  BulletWrapPickUp (float x, float y)
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
        fill(Purple);
       // triangle(pos.x - halfW/2,pos.y  - halfW, pos.x + halfW,pos.y + halfW,pos.x  - halfW,pos.y + halfW);
       ellipse(pos.x,pos.y,radius,radius);
  }
  void PickedUp(ArrayList<BulletWrapPickUp> BulletWrapDrops)
  {
  //    lives += 1;
  //    increase_LivesDrops.remove(this);
  }
}
