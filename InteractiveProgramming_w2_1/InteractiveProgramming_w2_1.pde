Ball ball;
int x, y;
float bounce, ballWidth, ballHeight, bounceWall, velocity, velocityX;

void setup(){
  size(800, 600);
  ball = new Ball();
}

void draw(){
  background(255);
  ball.draw();
}

void mouseReleased()
{
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
  velocityX = random(2);
  ball = new Ball(x, y, bounce, ballWidth, ballHeight, bounceWall, velocity, velocityX);
  
}
