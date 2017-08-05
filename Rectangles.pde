class Rectangles 
{
  float x;
  int size;
  int h;
  boolean score;
  boolean live;
  int speed;
  int r, g, b;
  Rectangles(float a, int b) 
  {
    size = b;
    x = a;
    h = (int)random(100, 300);
    score = false;
    live = true;
    speed = 2;
    r = (int)random(0, 255);
    g = (int)random(0, 255);
    b = (int)random(0, 255);
  }
  void drawRect() 
  {  
    if (x < width && x > -25) {
    rectMode(CENTER);
    fill(r, g, b);
    rect(x, h/2, 50, h);
    fill(255);
    //stroke(0);
    rect(x, h + 75, 50 ,150);
    fill(r, g, b);
    //noStroke();
    rect(x, h + 150 + (350-h)/2 , 50, 350 - h);
    }
  }
  void update() {
    drawRect();
    x = x - speed;
  }
  void stopper() {
    speed = 0;
  }
  
  int hitBall(PVector loc) {
    int returner = 2;
    if (loc.x > x - 10 && loc.x < x + 50)
    {
      if (loc.y < h + 15 || loc.y > (125 + h) )
      {
        if (live == true) { returner = 0;
        println("OUT!"); }
        live = false;
        score = true;
      }
      else
      {
        if (score == false) { println("SCORED!!"); returner = 1;}
        score = true;
      }
    }
    if (loc.y < h-15 || loc.y > 150 + h + 20) {
      if (loc.x > x - 45 && loc.x < x + 50) {
        if (live == true) { returner = 0;
        println("OUT!"); }
        live = false;
        score = true;
      }
    }
    return returner;
  } 
}