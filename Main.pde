import gifAnimation.*;      //Biblioteca para utilizar el fondo GIF animado.
import processing.sound.*;
Gif fondoAnimado;           //Variable que permite realizar al animación del fondo a través de un archivo GIF.
Gif finJuego;               //Variable que permite realizar al animación del fondo de Fin de Juego.
Fondo fondo;                //Variable que almacena el fondo.
SoundFile musicaFondo;
SoundFile danio;
SoundFile disparar;
SoundFile ataqueEnemigo1;
 
boolean gameOver = false;   //Bandera que se activa cuando el Dragón pierde todas las vidas. Fin del Juego.
int direccionH = 0;         //Dirección horizontal.
int direccionV = 0;         //Dirección vertical.

boolean detectarColision = false;       //Bandera que detecta la colisión de Enemigos con el Dragón.
ArrayList <Disparo> disparosDragon;     //Array que almacenan los disparos del Dragón.
ArrayList <Disparo> disparosE2;         //Array que almacenan los disparos de EnemigoNivel2.
ArrayList <Disparo> disparosE3;         //Array que almacenan los disparos de EnemigoNivel3.

Dragon dragon;
EnemigoNivel1 enemigoNivel1;
EnemigoNivel2 enemigoNivel2;
EnemigoNivel3 enemigoNivel3;
Disparo disparoE2;
Disparo disparoE3;

int puntos = 20;           //Contador de Puntos del Juego.
int nivel;                //Variable que representa el Nivel del Juego.
Bonus bonus; // llamo a la clase bonus 

void setup(){
  
  
  size(596,396);                                      //Se modifica el tamaño del lienzo según las dimensiones del fondo GIF. 
  
  fondoAnimado = new Gif(this, "FONDO1PRUEBA.gif");   //Se carga el archivo GIF del fondo del lienzo.
  fondoAnimado.play();
  
  finJuego = new Gif(this, "gameover1.gif");           //Se carga el archivo GIF de Fin de Juego.
  finJuego.play();
  
  musicaFondo = new SoundFile(this, "musicanivel3.mp3");
 // musicaFondo.play();
  danio = new SoundFile(this, "recibirDanio.mp3");
  disparar = new SoundFile(this, "fuegoDragon.mp3");
  ataqueEnemigo1 = new SoundFile(this, "ataqueEnemigo.mp3");
  
  fondo = new Fondo(width,height);                    //Se crea un fondo animado en el lienzo.
  
  dragon = new Dragon();                              //Se instancia objeto Dragón.
  
  disparosDragon = new ArrayList();                   //Arraylist de disparos del Dragón.
  disparosE2 = new ArrayList();                       //Arraylist de disparos de EnemigosNivel2.
  disparosE3 = new ArrayList();                       //Arraylist de disparos de EnemigosNivel3.
  
  listaEnemigo1 = new ArrayList();                    //ArrayList de Objetos de la Clase "EnemigoNivel1".
  enemigoNivel1 = new EnemigoNivel1();                //Se instancia un objeto de la Clase "EnemigoNivel1".
  enemigoNivel1.crearListaEnemigos();                 //Se crea la lista de "EnemigosNivel1".
  
  listaEnemigo2 = new ArrayList();                    //ArrayList de Objetos de la Clase "EnemigoNivel2".
  enemigoNivel2 = new EnemigoNivel2();                //Se instancia un objeto de la Clase "EnemigoNivel2".
  enemigoNivel2.crearListaEnemigos();                 //Se crea la lista de "EnemigosNivel2".
  
  listaEnemigo3 = new ArrayList();                    //ArrayList de Objetos de la Clase "EnemigoNivel3".
  enemigoNivel3 = new EnemigoNivel3();                //Se instancia un objeto de la Clase "EnemigoNivel3".
  enemigoNivel3.crearListaEnemigos();                 //Se crea la lista de "EnemigosNivel3". 
    
  bonus = new Bonus(dragon); //inicializo la clase bonus 

}

void draw(){
  
  
  if (!gameOver){
    background(fondoAnimado);               //Se muestra el fondo animado desde el archivo GIF.
  
    dragon.display();                       //Se muestra el Dragón.  
    dragon.mover(direccionV, direccionH);   //Se mueve el Dragón en dirección de las teclas presionadas.    
    dragon.disparar();                      //El Dragón dispara bolas de fuego.   
                                          
    if (puntos < 20){                       //Se controlan los puntos para designar el Nivel correspondiente.
      nivel = 1; 
    }
    else{
      if ((puntos >= 20) && (puntos < 40)){
        nivel = 2;
      }        
      else{
        if ((puntos >= 40) && (puntos < 60)){
          nivel = 3;
        }
        else{
          println("Juego Ganado.");
          //Agregar fondo animado...
        }
      }
    }
    
    
    switch(nivel){
    case 1:{
      //println("Nivel 1");
      enemigoNivel1.mostrarListaEnemigos();
      
      //Reinician las posiciones.
      if (listaEnemigo1.get(listaEnemigo1.size()-1).posicion.y == -20) {
          enemigoNivel1.reiniciarPosiciones();
      }   
    }
    break;
    case 2:{
      //println("Nivel 2");
      enemigoNivel2.mostrarListaEnemigos();
             
      //Reinician las posiciones.
      if (listaEnemigo2.get(listaEnemigo2.size()-1).posicion.y == -20) {
         enemigoNivel2.reiniciarPosiciones();
      }
      
      //Se recorre la lista de Disparos del EnemigoNivel2 para mostrarlos y que se desplacen. 
      for (int i = 0; i < disparosE2.size(); i++){
        Disparo disparoE = disparosE2.get(i);  //Se obtiene el Disparo según el índice "i".
        disparoE.mostrarDisparosE();           //Se muestra el Disparo.
        disparoE.moverDisparoE();              //Se realiza el desplazamiento del Disparo.  
      }      
    }
    break;
    case 3:{
      //println("Nivel 3");
      enemigoNivel3.mostrarListaEnemigos();
       
      //Reinician las posiciones.
      if (listaEnemigo3.get(listaEnemigo3.size()-1).posicion.y == -20) {
         enemigoNivel3.reiniciarPosiciones();
      }
      
      //Se recorre la lista de Disparos del EnemigoNivel3 para mostrarlos y que se desplacen. 
      for (int i = 0; i < disparosE3.size(); i++){
        Disparo disparoE = disparosE3.get(i);  //Se obtiene el Disparo según el índice "i".
        disparoE.mostrarDisparosE();           //Se muestra el Disparo.
        disparoE.moverDisparoE();              //Se realiza el desplazamiento del Disparo.  
      }      
    }
    break;
    }
                                           
    //Se recorre la lista de disparos del Dragón para mostrarlos y que se desplacen. 
    for (int i = 0; i < disparosDragon.size(); i++){
      //eso obtiene el siparo que esta en la posicion dicha 
      Disparo d = disparosDragon.get(i);
      d.display();
      d.move();
    }    
        
    dragon.verificarVida();        //Se controla el contador de vidas del Dragón. Tiene 3 vidas de forma inicial.
  }  
  else {
    background(finJuego);          //Si el contador de vidas del Dragón es cero (0), se muestra el fondo animado de Fin de Juego.
  }
}

/* Configura lo que sucede cuando se presiona una tecla. */
void keyPressed() {         
   if (key == 'a' || key =='A' ) {
            direccionH = -2;
          
        }
        if (key == 'd' || key =='D' ) {
            direccionH = 2;
           
        }
        if (key == 'w' || key =='W' ) {
            direccionV = -2;
            
        }
        if (key == 's' || key =='S' ) {
            direccionV = 2;         
        }
        dragon.mover(direccionV, direccionH);
    } 


/* Controla las acciones al soltar las teclas. */
void keyReleased(){
        if (key == 'a' || key =='A' ) {
            direccionH = 0;
          
        }
        if (key == 'd' || key =='D' ) {
            direccionH = 0;
           
        }
        if (key == 'w' || key =='W' ) {
            direccionV = 0;
            
        }
        if (key == 's' || key =='S' ) {
            direccionV = 0;         
        }
    }
