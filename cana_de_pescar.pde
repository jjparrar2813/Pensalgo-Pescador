class Cana{
 float posX;
 float posY;
 
  public Cana(float X, float Y){
   posX = X;
   posY = Y; 
  }
  
  void pintarse(){ //forma de pescar
    stroke(#362A2A);
    strokeWeight(5);
    line(posX + 40, posY, posX + 40 ,posY);
    }
  
  void pescar(){ //forma de pescar
    if((mouseY > 300) && (mouseY < 700)){
    stroke(#362A2A);
    strokeWeight(5);
    line(posX + 40, posY, posX + 40 , mouseY);
    }
  }
  void moverse(){ // forma de mover el barco 
      if(keyPressed){
        if(key == CODED){
          if(keyCode == RIGHT){ // se mueve a la derecha
        posX = posX + 1.5;
        } 
      else if(keyCode == LEFT){ // se mueve a la izquierda
        posX = posX - 1.5;
      }
   }
 }
 }
}
