Element[] e;
Obstacle ob;

int num;
int startX, startY;
float bounce, ballWidth, ballHeight, bounceWall, velocity, velocityX;
int x, y;

boolean isVisible;

void setup() {
  size(800, 600);
  e = new Element[100];
  ob = new Obstacle(height/2, width/2, 200, 100);
  for (int i = 0; i < 100; i++) {
    e[i] = new Element(ob, 0, 0, 0, 0);
  }
  isVisible = true;
}

void draw() {
  background(255, 255, 255);
  for (int i = 0; i <100; i++) {
    e[i].drawCircle();
    //  noFill();
    if (isVisible) {
      fill(10, 10, 10);
      rect(ob.x, ob.y, ob.w, ob.h);
    }
  }
}

void mouseMoved() {

  x = mouseX;
  y = mouseY;
  //跳ね返り係数を0 < bounce < 1でランダムに設定
  //0は全く跳ね返らない、1でエネルギーの損失なしに跳ね返る
  bounce = random(1);
  //ボールの縦横を30ピクセルでランダムに設定
  ballWidth = random(30);
  ballHeight = ballWidth;
  bounceWall= random(1);
  velocity = random(2);
  velocityX = random(-2, 2);
  e[num] = new Element(ob, x, y, bounce, ballWidth, ballHeight, bounceWall, velocity, velocityX);
  if (num < 99) {
    num++;
  }
  else {
    num = 0;
  }
}

void keyPressed() {
  if (keyCode == UP) {
    isVisible = true;
  }
  else if (keyCode == DOWN ) {
    isVisible = false;
  }
}

