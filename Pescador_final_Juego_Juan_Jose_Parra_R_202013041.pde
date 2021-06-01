//Juan Jose Parra Rebolledo - 202013041
//Pescador

//cancion
import processing.sound.*;
SoundFile Cancion;

//tabla
Table tablaPuntos;
int numFilas;
String nomJugador = "";

//clases

Burbuja[] Burbuja;// burbujas
int numburbuja = 10;

Sol Sol; //sol

Submarino Submarino; // submarino

Barco Barco; // barco
int x_ = width/2;
int y_ = 300;

Cana Cana;// caña de pescar

Timer Timer;// timer

Nubes[] Nube;// nubes
int numnubes = 8;

Pescado[] Pescado; // pescados
int numpescado = 20;

Pescados[] Pescados; // pescados muertos
int numpescados = 12;

Tiburon Tiburon; // tiburon

//Variable de estado
int estado = 0;
int Inicio = 1;
int Instrucciones = 2;
int Juego = 3;
int Game_over = 4;
int Nombre = 5;
int Puntos = 6;

int estActual = Inicio;

int puntos;
int Oportunidades;

//fuente de texto
PFont Fuente;
PFont Fuente2;
PFont Fuente3;

// imagenes
PImage Corazon;
PImage Flechas;
PImage Mouse;

int tiempoInicial;
int tiempoJuego;

void setup(){
 size(1000,700);
 background(#50C0EA); 
 
 //cancion
 Cancion = new SoundFile(this,"y2mate.com - Ice Cream 8Bit.mp3");;
 Cancion.play();
 Cancion.amp(0.1);
 Cancion.loop();
 
 //imagenes
 Corazon = loadImage("corazon 8bit.png");
 Corazon.resize(30,30);
 imageMode(CENTER);
 
 Flechas = loadImage("flechasjuego.png");
 Flechas.resize(150,100);
 imageMode(CENTER);
 
 Mouse = loadImage("mouse.png");
 Mouse.resize(100,60);
 imageMode(CENTER);
 
 //tabla
 tablaPuntos = loadTable("data/puntaje_pescador.csv", "header");
 numFilas= tablaPuntos.getRowCount();
 println(numFilas);

 //clases
 Burbuja = new Burbuja[numburbuja];
 Sol = new Sol();
 Submarino = new Submarino();
 Barco = new Barco(x_,y_);
 Tiburon = new Tiburon();
 Pescado = new Pescado[numpescado];
 Pescados = new Pescados[numpescados];
 Nube = new Nubes[numnubes];
 Timer = new Timer();
 Cana = new Cana(x_,y_);
 
 //tiempo
 tiempoInicial = millis();
 
 //fuente
 Fuente = loadFont("KCPixelHandRegular-48.vlw");
 Fuente2 = loadFont("KCLeisureParkInked-48.vlw");
 Fuente3 = loadFont("VCROSDMono-48.vlw");
 
 for(int n=0; n<numnubes; n = n + 1){
   Nube[n] = new Nubes(random(0,1000),random(0,300)); 
 }
   
 for(int p=0; p<numpescado; p = p + 1){
   Pescado[p] = new Pescado(); 
 }
   
 for (int M=0; M<numpescados; M = M +1){
   Pescados[M] = new Pescados();
 }
   
 for (int b=0; b<numburbuja; b = b +1){
   Burbuja[b] = new Burbuja(); 
 }
}

void draw(){
  // estado del inicio del juego
  if(estActual == Inicio){
   background(#50C0EA);
   puntos = 0;
   Oportunidades = 3;
   
   for(int n=0; n<numnubes; n = n + 1){
   Nube[n].pintarse();
   Nube[n].mover(); }
   
   Barco.pintarse();
   
   noStroke();
   fill(#107D9D);
   rect(0,300,1000,400); 
   
 for(int p=0; p<numpescado; p = p + 1){
   Pescado[p].pintarse();
   Pescado[p].moverse(); 
  if(Pescado[p].posX < 0){
     Pescado[p].volver();
  }
 }
 
  Tiburon.pintarse();
  Tiburon.moverse();
  
   for (int b=0; b<numburbuja; b = b +1){
   Burbuja[b].pintarse();
   Burbuja[b].subir();}
   
  Submarino.pintarse();
  Submarino.moverse();
  
  fill(#AF1C32);   // botones para cambiar de estado (juego final)
  stroke(#342F30);
  strokeWeight(5);
  rect(300,350,400,50); // boton para iniciar a jugar (no esta listo)
  rect(300,450,400,50); // boton para leer las instrucciones (no esta listo)
  
  textAlign(CENTER);
  fill(0);
  textFont(Fuente);
  textSize(100);
  text("PESCADOR",500,200);
  
  fill(255);
  textFont(Fuente);
  textSize(30);
  text("Iniciar juego",500,385);
  text("¿Como jugar?",500,485);
  
  }
  if(estActual == Instrucciones){ //estado de las instrucciones del juego
   background(#50C0EA);
   
   for(int n=0; n<numnubes; n = n + 1){
   Nube[n].pintarse();
   Nube[n].mover(); }
   
   Barco.pintarse();
   
   noStroke();
   fill(#107D9D);
   rect(0,300,1000,400); 
   
   for (int b=0; b<numburbuja; b = b +1){
   Burbuja[b].pintarse();
   Burbuja[b].subir();}
   
  Tiburon.pintarse();
  Tiburon.moverse();
  
  Submarino.pintarse();
  Submarino.moverse();
   
  fill(#342F30,180);
  noStroke();
  rect(200,100,600,500);
  
  noFill();
  stroke(#AF1C32);
  strokeWeight(10);
  rect(200,100,600,500);
  
  textAlign(CENTER);
  fill(255);
  textFont(Fuente2);
  textSize(20);
  text("Como jugar Pescador:",500,140);
  text("Mueve el barco con los controles de derecha y izquierda en tu teclado",500,200);
  text("Utiliza el mouse para mover la caña de pescar para atrapar a los pescados",500,320);
  text("el objetivo de juego es pescar los pescados en la menor cantidad de tiempo",500,430);
  text("si tocas los peces muertos o el tiburon perderas una oportunidad",500,460);
  text("si se te acaban las oportunidades es GAME OVER",500,490);
  
  image(Flechas,500,250);
  image(Mouse,500,360);
   
  fill(255);
  textFont(Fuente2);
  textSize(50);
  text("Instrucciones",500,80);
  
  fill(#AF1C32);  // "boton" para iniciar a jugar despues de leer las instrucciones 
  noStroke();
  rect(350,530,300,50);
  
  fill(255);
  textFont(Fuente);
  textSize(20);
  text("A jugar!!!",500,560);
 }
 
 if(estActual == Juego){ // estado del juego
  background(#50C0EA);
  
  for(int n=0; n<numnubes; n = n + 1){
   Nube[n].pintarse();
   Nube[n].mover(); }
  
  Sol.pintar();
  
  Barco.pintarse();
  Barco.moverse();
  
  noStroke();
  fill(#107D9D);
  rect(0,300,1000,400);
  
  Cana.pintarse();
  Cana.pescar();
  Cana.moverse();
  
  for(int p=0; p<numpescado; p = p + 1){
   Pescado[p].pintarse();
   Pescado[p].moverse(); 
   if(Pescado[p].posX < 0){
     Pescado[p].volver();
   }
  
  // si la caña de pescar atrapa un pescado naranja esta más cerca de ganar
  float distPyC = dist(Cana.posX + 40, mouseY, Pescado[p].posX,Pescado[p].posY);
  if (distPyC < 20){
    puntos = puntos + 1;
    
  //Pescado[p].desaparecer();
  Pescado[p].posX = 1050;
  Pescado[p].posY = random(350,680);
  
}

  }
 for (int M=0; M<numpescados; M = M +1){
   Pescados[M].pintarse();
   Pescados[M].moverse();  
   
  //si el barco toca a los pesces muertos pierde una oportunidad
  float distcyc = dist(Cana.posX + 40, mouseY , Pescados[M].posX,Pescados[M].posY);
  if (distcyc < 20){
    Oportunidades = Oportunidades - 1;
    //Pescados[M].desaparecer();
    Pescados[M].posX = -20;
    Pescados[M].posY = random(350,680);
  }
 }
  // si se pierden las 3 oportunidades es game over
  if(Oportunidades <= 0){
    estActual = Game_over;
  }
  
   for (int b=0; b<numburbuja; b = b +1){
   Burbuja[b].pintarse();
   Burbuja[b].subir();}
  
  Tiburon.pintarse();
  Tiburon.moverse();
  
  // si el barco toca al tiburon se pierde una oportunidad
  float distCyC = dist(Cana.posX + 40 , mouseY, Tiburon.posX, Tiburon.posY);
  if(distCyC < 40){
    Oportunidades = Oportunidades - 1;
    Tiburon.posX = 1010;
  }
  
  Submarino.pintarse();
  Submarino.moverse();
  
  float distcyc = dist(Cana.posX + 40, mouseY , Submarino.posX,Submarino.posY);
  if (distcyc < 20){
    Oportunidades = Oportunidades - 1;
    Submarino.posX = -10;
  }
  
  Timer.pintarse();
   
  fill(#AF1C32);
  textFont(Fuente);
  textSize(20);
  String p = "pescados: " + puntos;
  text(p,850,20);
 
  
  fill(#AF1C32);
  textFont(Fuente);
  textSize(20);
  String o = "Oportunidades: " + Oportunidades;
  text(o,120,20);
  
  image(Corazon,250,15);
  
  }
  
  if(estActual == Game_over){ // estado de cuando el jugador pierde
  background(#100B4D);
  
  Cancion.pause();
  
  fill(#AF1C32); // botones 
  stroke(#FFFFFF);
  strokeWeight(5);
  rect(300,450,400,50); // boton para regresar al menu principal 
  
  textAlign(CENTER);
  fill(255);
  textFont(Fuente);
  textSize(100);
  text("GAME OVER",500,200);
  
  fill(255);
  textFont(Fuente);
  textSize(30);
  text("Siguiente",500,485);
  
  }
  
  if(estActual == Nombre){
  background(#50C0EA);
   
   for(int n=0; n<numnubes; n = n + 1){
   Nube[n].pintarse();
   Nube[n].mover(); 
 }
   
   Barco.pintarse();
   
   noStroke();
   fill(#107D9D);
   rect(0,300,1000,400); 
   
   for (int b=0; b<numburbuja; b = b +1){
   Burbuja[b].pintarse();
   Burbuja[b].subir();
 }
  
  Submarino.pintarse();
  Submarino.moverse();
  
  Tiburon.pintarse();
  Tiburon.moverse();
   
  fill(#342F30,180);
  noStroke();
  rect(200,100,600,500);
  
  noFill();
  stroke(#AF1C32);
  strokeWeight(10);
  rect(200,100,600,500);
  
  textAlign(CENTER);
  fill(255);
  textFont(Fuente3);
  textSize(50);
  text("Escribe tu nombre",500,250);
  text(nomJugador, 500,350);
  
  
  fill(#AF1C32); // botones 
  stroke(#FFFFFF);
  strokeWeight(5);
  rect(300,450,400,50);
  
  fill(255);
  textFont(Fuente);
  textSize(30);
  text("Presiona Enter",500,485);
  
  }
  
   if(estActual == Puntos){
  background(#50C0EA);
   
   for(int n=0; n<numnubes; n = n + 1){
   Nube[n].pintarse();
   Nube[n].mover(); }
   
   Barco.pintarse();
   
   noStroke();
   fill(#107D9D);
   rect(0,300,1000,400); 
  
  Submarino.pintarse();
  Submarino.moverse();
   
  fill(#342F30,180);
  noStroke();
  rect(200,50,600,600);
  
  noFill();
  stroke(#AF1C32);
  strokeWeight(10);
  rect(200,50,600,600);
  
  fill(#AF1C32); 
  stroke(#FFFFFF);
  strokeWeight(5);
  rect(300,450,400,50);
  
  textAlign(CENTER);
  fill(255);
  textFont(Fuente);
  textSize(30);
  text("Volver al menu",500,485);
 
    textFont(Fuente3);
    
    for (int i = 0; i < numFilas; i = i+1) {
      
      String nombre = tablaPuntos.getString(i, "Nombre");
      int puntaje = tablaPuntos.getInt(i, "Puntaje");

      fill(255);
      textSize(25);
      text(nombre + "   " + puntaje + " " + "puntos", width/2, (200)+(i*25));
      textSize(40);
      text("PUNTAJE", width/2, height/6);
    }
  }
}

  void keyPressed () {
  
   if (estActual == Nombre) {
 if (keyCode == ENTER) {
      
       TableRow nuevaFila = tablaPuntos.addRow();
      nuevaFila.setString("Nombre", nomJugador);
      nuevaFila.setInt("Puntaje", puntos);

      if (tablaPuntos.getRowCount() > 8) {
        tablaPuntos.removeRow(7);
      }
      
      tablaPuntos.sortReverse("Puntaje");

      saveTable(tablaPuntos, "data/puntaje_pescador.csv");

      tablaPuntos = loadTable("data/puntaje_pescador.csv", "header");
      numFilas = tablaPuntos.getRowCount();
      
      fill (255);
      nomJugador = "";

      estActual = Puntos;
    } else if (keyCode == SHIFT) {
    } else if (keyCode == BACKSPACE) {
      if (nomJugador.length()>0) {
        nomJugador = nomJugador.substring(0, nomJugador.length()-1);
      }
    } else {
      nomJugador = nomJugador + key;
      }

   }
}
  
void mouseReleased() {
    //de inicio a juego
    if(estActual == Inicio && mouseX > 300 && mouseX < 700 && mouseY > 350 && mouseY < 400){
      estActual = Juego;
       for(int p=0; p<numpescado; p = p + 1){
   Pescado[p].pintarse();
   Pescado[p].moverse();  
    }
    }
    //de inicio a instrucciones
    else if(estActual == Inicio && mouseX > 300 && mouseX < 700 && mouseY > 450 && mouseY < 500){
      estActual = Instrucciones;
    }
    //de instrucciones a juego
    else if(estActual == Instrucciones && mouseX > 350 && mouseX < 650 && mouseY > 530 && mouseY < 580){
      estActual = Juego;
   }
   // de game over a inicio   
  else if(estActual == Game_over && mouseX > 300 && mouseX < 700 && mouseY > 450 && mouseY < 500){
    estActual = Nombre; 
  }
    else if(estActual == Puntos && mouseX > 300 && mouseX < 700 && mouseY > 450 && mouseY < 500){
    estActual = Inicio; 
    for(int p=0; p<numpescado; p = p + 1){
   Pescado[p].pintarse();
   Pescado[p].moverse();  
    Cancion.play(); 
    Cancion.loop();
  }
  }
}
