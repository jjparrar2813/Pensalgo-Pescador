class Submarino{
  float posX;
  float posY;
   
  public Submarino(){
    posX = 500;
    posY = 600;
  }  
  //movimiento del submarino
  void moverse(){
    if(posX > 1000){
    posX = 0;
    posY = random(350,700);
  } 
  }
  //pintar el submarino
  void pintarse(){
    noStroke();
    fill(#797974);
    ellipse(posX,posY,80,45);
    rect(posX,posY - 35,5,25);
    rect(posX,posY - 35,10,5);
    
    stroke(#0B119B);
    strokeWeight(2);
    fill(#0099DE);
    ellipse(posX - 20,posY,10,10);
    ellipse(posX ,posY,10,10);
    ellipse(posX + 20 ,posY,10,10);
    
    posX = posX + 1.5;
    
  }
  
  
}
