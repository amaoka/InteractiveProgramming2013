//Simple Drawing by traking the brightness position.


//まず、カメラから画像を実時間で取得するために、ライブラリを読み込む
import processing.video.*;

// Size of each cell in the grid

//ピクセルの代わりになる、基本図形の大きさを決める。ここでは、15ピクセル

int cellSize = 15;
// Number of columns and rows in our system

//行と列にいくつの基本図形を並べるかその数を保存するための変数。

int cols, rows;
// Variable for capture device

int brightestX, brightestY;
float oldC;

int num;
int[][] position;

//カメラの為の変数　<-　実際には、ライブラリから生成したオブジェクトを入れておくための変数
Capture video;
void setup() {
  size(640, 480, P2D);
  // Set up columns and rows

  //列にいくつの基本図形を並べられるか計算し、その結果を保存
  cols = width;

  //行にいくつの基本図形を並べられるか計算し、その結果を保存
  rows = height;
  position = new int[100][2];
  num = 0;
  //色とrectのモードを指定
  colorMode(RGB, 255, 255, 255, 100);
  rectMode(CENTER);

  // Uses the default video input, see the reference if this causes an error

  //　ライブラリを使うためにオブジェクトを生成し変数に代入

  video = new Capture(this, width, height);

  //キャプチャをスタート
  video.start();

  background(0);
}
void draw() {
  brightestX = 0;
  brightestY = 0;
  oldC = 0;
  //カメラが使用できる状態か確認し
  if (video.available()) {

    //問題なければカメラから画像データを読み込み
    video.read();

    //ピクセルデータをプログラム内で処理できるように画像データからピクセルデータを取得
    video.loadPixels();

    background(0, 0, 255);
    image(video, 0, 0);
    // Begin loop for columns

    //ここからは、配列で与えられたピクセル（の色）データを一つずつ処理する

    //まずは、列の繰り返し
    for (int i = 0; i < cols;i++) {
      // Begin loop for rows

      //次に行の繰り返し
      for (int j = 0; j < rows;j++) {

        // Where are we, pixel-wise?



        //配列のどのインデックスのデータが欲しい色情報かを計算する。画像は、2次元。ピクセルデータの配列は1次元。変換が必要！
        int loc = (video.width - i - 1) + j*video.width; // Reversing x to mirror the image

        // Each rect is colored white with a size determined by brightness

        //計算した位置の色を取得し、変数に代入

        color c = video.pixels[loc];

        //基本図形rectを描画！

        if (brightness(c) > oldC) {// && blue(c) < 5 && green(c) < 5) {
          brightestX = i;
          brightestY = j;
          oldC = brightness(c);
        }
      }
    }
    println(oldC);
    ellipse(width-brightestX, brightestY, 10, 10);
     
    position[num][0] = width-brightestX;
    position[num][1] = brightestY;
   
    if (num < 99) {
      num++;
    }
    else {
      num = 0;
    }
  }
  for (int i = 1; i < 100; i++) {
    stroke(255);
    line(position[i-1][0], position[i-1][1], position[i][0], position[i][1] );
  }
}

