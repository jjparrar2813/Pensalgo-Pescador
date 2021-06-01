class Barco{
 float posX;
 float posY;
 Boolean Vivo;
 
 public Barco(float X, float Y){
   posX = X;
   posY = Y;   
   Vivo = true;
 }
  void pintarse(){
    noStroke();
    fill(#FFFCFC);
    rect(posX - 35,260,70,40);
    
    noStroke();
    fill(#362A2A);
    quad(posX - 50,280,posX + 50,280,posX + 40,300,posX - 40,300);
    
    fill(#525355);
    noStroke();
    ellipse(posX - 20,270,13,13);
    ellipse(posX,270,13,13);
    ellipse(posX + 20,270,13,13);
    
    fill(#0B4BB7);
    noStroke();
    ellipse(posX - 20,270,10,10);
    ellipse(posX ,270,10,10);
    ellipse(posX + 20,270,10,10);
    
    fill(#000000);
    noStroke();
    rect(posX - 30,225,15,30,5);
    rect(posX - 10,230,10,30,5);
    
    fill(#C40C12);
    noStroke();
    rect(posX - 40,250,80,10,8);
    
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
 
  //void pescar(){ //forma de pescar
  //  if((mouseY > 300) && (mouseY < 700)){
  //  stroke(#362A2A);
  //  strokeWeight(5);
  //  line(posX + 40, posY, posX + 40 , mouseY);
  //  }  
  //}
}
