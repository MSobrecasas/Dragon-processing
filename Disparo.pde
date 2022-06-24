class Disparo{
  //Atributos de la Clase Disparo
 private PVector posicion;
 private float velocidad;
 private PImage ataque;
 
 //Contructor por defecto.
 public Disparo(){}
 
 //Contructor Parametrizado 1.
 public Disparo(PVector posicion, float velocidad){
   this.posicion =posicion;
   this.velocidad = velocidad;
   this.ataque = requestImage("resources/images/ataque.png");  // Se carga el Sprite del Disparo de Dragón. 
 }
 
 //Contructor Parametrizado 2.
 public Disparo(PVector posicion, float velocidad, int tipoEnemigo){
   this.posicion = posicion;
   this.velocidad = velocidad;
   
   if (tipoEnemigo == 2){
     this.ataque = requestImage("resources/images/disparoEnemigo2.png");  // Se carga el Sprite del EnemigoNivel2.
   }
   else{
     this.ataque = requestImage("resources/images/disparoEnemigo3.png");  // Se carga el Sprite del EnemigoNivel3.
   }
    
 }
 
 /* Muestra los disparos de Dragón. */
 public void display(){
   image(this.ataque.get(0,20,20,70),this.posicion.x + 17,this.posicion.y - 50);   //Frames y Coordenadas del disparo del Dragón.
   this.move();
 }
 
  /* Permite el movimiento de los disparos del Dragón. */ 
  public void move(){
    this.posicion.y -= this.velocidad;
  }

  /* Muestra los Disparos de Enemigos */
  public void mostrarDisparosE(){
    image(this.ataque.get(0,0,50,50),this.posicion.x,this.posicion.y);   //Frames y Coordenadas del disparo de Enemigo.
    this.moverDisparoE();
 }
 
 /* Realiza el movimiento de los Disparos de Enemigos. */ 
 public void moverDisparoE(){
    this.posicion.y -= this.velocidad;
  }
  
}
