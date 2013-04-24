class Element {


  //重力

  float gravity;

  //速度

  float velocity;

  //ボールの位置

  float x, y;

  //床の跳ね返り係数

  float bounce;

  // ボールの縦横のサイズ

  float ballWidth, ballHeight;

  //横方向の跳ね返り係数、速度

  float bounceWall, velocityX;
  Obstacle ob;
  Obstacle[] obs;
  
  Element(float _x, float _y) {
    x = _x;
    y = _y;
  }

  Element(Obstacle _ob, float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    ballWidth = _w;
    ballHeight = _h;
      ob = _ob;
  }

  Element() {

    velocity = 1;

    gravity = 1;

    bounce = 0.9;

    velocityX = 1;

    bounceWall = 0.8;

    //出発地点設定

    x = width/2;

    y = 0;

    //円の基準を設定

    ellipseMode(CENTER);

    //円の大きさ

    ballWidth=10;

    ballHeight=10;
    
   
  }

  Element(Obstacle _ob, int _x, int _y, float _bounce, float _ballWidth, float _ballHeight, float _bounceWall, float _velocity, float _velocityX) {
    //出発地点設定
    x = _x;
    y = _y; 

    velocity = _velocity;
    gravity = 1;
    bounce = _bounce;
    velocityX = _velocityX;
    bounceWall = _bounceWall;
    ob = _ob;
    //円の基準を設定
    ellipseMode(CENTER);
    //円の大きさ
    ballWidth=_ballWidth;
    ballHeight=_ballHeight;
    
   
   
  }
  void drawRect() {

    rect(x, y, ballWidth, ballHeight);
  }

  void drawCircle() {
    //移動距離計算

    velocity = velocity +gravity;

    //円の現在位置を計算

    y = y + velocity;

    //円の水平方向の移動

    x = x + velocityX;

    //計算した位置で円を描画

    noStroke();

    fill(255, 0, 0);

    ellipse(x, y, ballWidth, ballHeight);

    //床での跳ね返りの計算

     bounce();
    //bounce(ob);
  }
/*
  void bounce() {

    //床のy座標はheightつまり画面の高さになるので600

    //-5は円が床の下にめり込まないように（円の中心がx, yなので）

    if (y >= height-ballHeight/2)

    {

      velocity = -velocity*bounce;

      //円の位置がheightよりも大きくなった場合の処置

      y = height-ballHeight/2;
    }

    //壁の跳ね返り計算

    if (x > width)

    {

      x = width-ballWidth/2;

      velocityX = -velocityX*bounceWall;
    }

    else if (x < 0)

    {

      x = ballWidth/2;

      velocityX = -velocityX * bounceWall;
    }
  }

  void bounce(Obstacle ob) {

    //床のy座標はheightつまり画面の高さになるので600

    //-5は円が床の下にめり込まないように（円の中心がx, yなので）

    if (y >= height-ballHeight/2)

    {

      velocity = -velocity*bounce;

      //円の位置がheightよりも大きくなった場合の処置

      y = height-ballHeight/2;
    }

    //壁の跳ね返り計算

    if (x > width)

    {

      x = width-ballWidth/2;

      velocityX = -velocityX*bounceWall;
    }

    else if (x < 0)

    {

      x = ballWidth/2;

      velocityX = -velocityX * bounceWall;
    }

    if (x < ob.x+ob.w && x > ob.x) {
      if (y >= ob.y-ballHeight/2) {
        velocity = -velocity*0.9;
        y = ob.y - ballHeight/2;
      }
    }
  }

  */
  
  
  void setObstacles(Obstacle[] _obs){
    obs = _obs.clone();
  }
  
  void bounce() {

    //床のy座標はheightつまり画面の高さになるので600

    //-5は円が床の下にめり込まないように（円の中心がx, yなので）

    if (y >= height-ballHeight/2)

    {

      velocity = -velocity*bounce;

      //円の位置がheightよりも大きくなった場合の処置

      y = height-ballHeight/2;
    }

    //壁の跳ね返り計算

    if (x > width)

    {

      x = width-ballWidth/2;

      velocityX = -velocityX*bounceWall;
    }

    else if (x < 0)

    {

      x = ballWidth/2;

      velocityX = -velocityX * bounceWall;
    }
         if (x < ob.x+ob.w && x > ob.x) {
          if (y >= ob.y-ballHeight/2) {
            velocity = -velocity*0.9;
            y = ob.y - ballHeight/2;
          }
      }
    
    
  }
}

