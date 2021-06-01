class Sol{
  float posX;
  float posY;
  
  public Sol(){
    posX = 0;
    posY = 0;
  }
  
  void pintar(){
    noStroke();
    fill(#FADE03);
    ellipse(posX + 500,posY + 150,200,200);
  }
   
}
