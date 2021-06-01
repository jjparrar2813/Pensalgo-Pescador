class Timer{
  float s= 0.01;
  int m= 0;
  float posX;
  float posY;
  
  public Timer(){
    posX = 500;
    posY = 150;
  }
  void pintarse(){
    fill(#AF1C32);
    textAlign(CENTER);
    textSize(15);
    textFont(Fuente);
    //delay(1000);
    if(s<=59){
      text(m + ":" + int(s),posX,posY);
      s = s + 0.01;
    }
    else{
      m = m + 1;
      s = 0;
      text( m + ":" + int(s),posX,posY);
    }
  }
  
}
