class Pescados {
  float posX;
  float posY;
  float vel;
  
  public Pescados (){
  posX = random(0,1000);
  posY = random(380,680);
  vel = random(0.0,2.5);
    
  }
  // pintar pescado
  void pintarse(){
    noStroke();
    fill(#359B58);
    ellipse(posX,posY,40,25);
    triangle(posX - 20,posY,posX - 25,posY + 10,posX - 25, posY - 10);
    
    noStroke();
    fill(255);
    ellipse(posX + 7,posY + 5,8,8);
    
    noStroke();
    fill(#0597F5);
    ellipse(posX + 7,posY + 5,4,4);
    
    posX = posX + vel;
  }
  //movimiento pescados
  void moverse(){
    if(posX > 1000){
    posX = 0;
    }
  } 
}
