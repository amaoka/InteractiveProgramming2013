import processing.video.*;

// Variable for capture device
Capture video;

int brightestX, brightestY;
float brightest;

void setup() {

  size(640, 480, P2D);
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height);
  brightestX = 0;
  brightestY = 0;
  brightest = 0;
  video.start();
  rectMode(CENTER);
}

void draw() {
  video.read();
  video.loadPixels();
  image(video, 0, 0);
  
  /***********************
  / この部分が抜けていた。追加する。
  ************************/
  
   brightestX = 0;
  brightestY = 0;
  brightest = 0;
  
  for (int y = 0; y < 480; y = y+1) { 
    for (int x = 0; x < 640; x = x+1) {
      color c = video.pixels[x+y*640];

      // fill(c);
      noFill();
      stroke(c);
      float size = brightness(c)/ 255 * 10;
   //   rect(x, y, size, size);
      if(brightness(c) > brightest){
        brightestX = x;
        brightestY = y;
        brightest = brightness(c);

      }
    }
  }
  fill(255, 255, 255);
  ellipse(brightestX, brightestY, 10, 10);
 
}

