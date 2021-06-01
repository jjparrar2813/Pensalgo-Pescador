class Tiburon{
  float posX;
  float posY;
  float vel;
  
  public Tiburon(){
    posX = 100;
    posY = 400;
    vel = 1.5;
  }
  
  void pintarse(){
    noStroke();
    fill(#92ACC1);
    ellipse(posX,posY,180,60);
    triangle(posX-20,posY, posX, posY - 60, posX+40,posY);
    triangle(posX + 90,posY,posX + 130,posY - 30,posX + 130, posY + 30);
    
    noStroke();
    fill(#ffffff);
    ellipse(posX - 65, posY - 10,13,13);
    
    noStroke();
    fill(0);
    ellipse(posX - 65, posY - 10,7,7);
    
    posX = posX - 2;
  }
    
  void moverse(){  
    if(posX < 0){
    posX = 1000;
    posY = random(350,700);
    }
    
  } 
    
  }
