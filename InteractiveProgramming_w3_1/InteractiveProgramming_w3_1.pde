Element[] e;
int num;


void setup(){
  size(800, 600);
  e = new Element[100];
   e[0] = new Element(10,10, 200, 100);
}

void draw(){
  background(255, 255, 255);
  for(int i = 0; i <num; i++){
    e[i].drawRect();
  }
}

void mousePressed(){

    e[num] = new Element(mouseX,mouseY, 200, 100);
    num = num +1;
}
