class Nubes{
  float posX, X=posX;
  float posY;
  int dir=1;
  
  public Nubes (float posXinicial,float posYinicial){
    posX = posXinicial;
    posY = posYinicial;
  }
   //movimiento de las nubes
   void mover(){
     posX = posX +1*dir;
     X=X+2*dir;
     if(X>1000 || X<=0){
       dir=-dir;
     }
   }
   // para pintar las nubes
  void pintarse(){
    noStroke();
    fill(#F2F8FA,200);
    ellipse(posX,posY,80,80);
    ellipse(posX - 115, posY + 5, 60,60);
    ellipse(posX - 65,posY - 15, 100,100);
  }
 
 
}
