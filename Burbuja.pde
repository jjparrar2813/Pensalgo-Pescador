class Burbuja{
 float posX;
 float posY;
 float alto;
 float ancho;
 float vel;
 
 
 Burbuja(){
   posX = random(0,1000);
   posY = random(380,700);
   alto = 30;
   ancho = 30;
   vel = random(0.2,2);
 }
  // movimiento para que suban las burbujas
  void subir (){
    if(posY < 325){
      posY = 650;
     
    }
      
  }
  // para que se pinten
  void pintarse() {
    noStroke();
    fill(#C6E6F0,200);
    ellipse(posX, posY,alto,ancho);
    posY = posY - vel;
    
  }

  
}
