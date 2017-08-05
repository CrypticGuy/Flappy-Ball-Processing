class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector gravity;
  PVector impulse;
  float max_speed;
  Ball() 
  {
    pos = new PVector (100, 250);
    gravity = new PVector (0, 0.2);
    acc = new PVector (0, 0);
    vel = new PVector(0, 0);
    impulse = new PVector(0, -2);
    max_speed =  8;
  }
  void update() 
  {
    if (keyPressed && key == CODED) 
    {
      if (keyCode == UP)
      {
        acc.add(impulse);
      }
    }
    acc.add(gravity);
    vel.add(acc);
    vel.limit(max_speed);
    pos.add(vel);
    fill(0);
    noStroke();
    ellipse(pos.x, pos.y, 40, 40);
    acc.mult(0);
  }
  void checkEdges() 
  {
    if (pos.y < 35) pos.y = 35;
    else if (pos.y > height - 35) 
    { 
      //pos.y = height - 15;
      float power = vel.mag();
      println(power);
      PVector pow = new PVector(0, -power*2);
      acc.add(pow);
    }
  }
  void onOut() {
    acc.mult(0);
    gravity.mult(0);
    vel.mult(0);
  }
  PVector returnPos()
  {
    return pos;
  }
}