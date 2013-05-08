import processing.video.*;

// Variable for capture device
Capture video;


void setup() {

  size(640, 480, P2D);
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height);
  video.start();
  rectMode(CENTER);
}

void draw() {
  video.read();
  video.loadPixels();
  //image(video, 0, 0);
   for (int x = 0; x < 640; x = x + 20) {
    for (int y = 0; y < 480; y = y + 20) { 
    
      color c = video.pixels[x+y*640];
      
     // fill(c);
      noFill();
      stroke(c);
      float size = brightness(c)/ 255 * 10;
      rect(x, y, size, size);
      
    }
  }
   println("exit");
}

