// Flappy Ball
// Developer: Vasu Goel & Karan Chugh
// Date: 18/07/2017

Ball b;
Rectangles[] rects;
PFont f,v;
int score;
boolean stopped;
int s = 2;
void setup() 
{
  size(800, 500);
  background(255);
  loopSetup();
}

void loopSetup()
{
  s = 2;
  stopped = false;
  score = 0;
  b = new Ball();
  rects = new Rectangles[10000];
  int i = 0;
  for (i = 0; i < 10000; i++)
  {
    rects[i] = new Rectangles(width - 30 + i*250, 60);
  }
  f = createFont("Arial", 20, true);
  v = createFont("Arial", 18, true);
}

void draw()
{
  mainLoop();
}

void mainLoop()
{ 
  int k = 2;
  background(255);
  //r.update();
  textFont(f, 16);
  text("Developed by:\n  Vasu Goel\n  Karan Chugh \n Press UP Arror to JUMP \n Hold to Move Higher" , width-250-s, height/2 - 20);
  s = s  + 2;
  for(Rectangles rect : rects) {
    k = rect.hitBall(b.returnPos());
    rect.update();
    if (k == 0) 
    {
      textFont(v);
      fill(255, 20, 20);
      text("Click Mouse to Retry", 10, 40);
      noLoop();    
      stopped = true;
    }
    else if (k == 1) {
      score++;
    }
  }
  b.checkEdges();
  b.update();
  text(score, 10, 20);
}

void mouseClicked() {
  if(stopped == true)
  {
    loopSetup();
    loop();
  }
}