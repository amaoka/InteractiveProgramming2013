class Element{

  int x, y;
  int w, h;
  
  Element(int _x, int _y){
    x = _x;
    y = _y;
  }
  
  Element(int _x, int _y, int _w, int _h){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  
  }
  
  void drawRect(){
  
    rect(x, y, w, h);
    
  }

}
