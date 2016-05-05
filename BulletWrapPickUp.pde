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
    ellipse(pos.x,pos.y,radius,radius);
    fill(255);
    float TextSize = 20.0f;
    textSize(TextSize);
    textAlign(CENTER);
    text("BULLETWRAP!",pos.x,pos.y);
  }
  void PickedUp(ArrayList<BulletWrapPickUp> BulletWrapDrops)
  {
  //    lives += 1;
  //    BulletWrapDrops.remove(this);
  }
}
