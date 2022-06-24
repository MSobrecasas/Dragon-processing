class Dragon {
  private Sprite imagen;
  private PVector posicion;
  private Sprite ataque;
  private Sprite recibirDanio;
  private int velocidadAtaque;
  private int nivelVida;
  private ArrayList<Sprite> Bonus  = new ArrayList<Sprite>();
  
  protected int widthFrame,heightFrame,xFrame,yFrame,cantFrames,contFrames;   //Ancho, Alto del Frame, Posicion de Inicio,
                                                                              //Cantidad de frames, Contador de Frames.
  
  
  //Constructor por Defecto.
  public Dragon(){
    this.posicion = new PVector(random(50,500),10);
    this.imagen = new Sprite("resources/images/dragon.png",45,48,6,this.posicion);
    // Agregar código de atributo "ataque" (Sprite).
    this.recibirDanio = new Sprite("resources/images/dragonDanio.png",45,48,6,this.posicion);
    // Agregar código de atributo "velocidadAtaque (int)".
    this.nivelVida = 3;
    // Agregar código de atributo "Bonus" (ArrayList).
  }


  
  /* Realiza la acción de movimiento del Dragón en el escenario
     según las telcas de dirección presionadas. */
  public void mover(int direccionV, int direccionH) {
    this.posicion = this.imagen.getPosicion();
    
    if (!colisionBorde()){
      this.posicion.x += direccionH;
      this.posicion.y += direccionV;
    }
    
    this.imagen.setPosicion(this.posicion);    
  }
  
  
  /* Permite que personaje dragon detecte los bordes. Luego se invoca al método reasignarPosición() para que 
     el dragon al toparse con el borde no se trabe o cambie el sentido al momento de moverse de nuevo. */ 
 private boolean colisionBorde(){
  
    if (this.posicion.x <= 0 || this.posicion.x >= width - this.imagen.getWidthFrame() || this.posicion.y <= 0 || this.posicion.y >= height - this.imagen.getHeightFrame()){
      reasignarPosicion();
      return true;
    }
    else {
      return false;
    }
 }

  /* Permite que el Dragon no traspase los bordes del escenario. */ 
  private void reasignarPosicion(){  
    
    if (this.posicion.x <= 0 ){
      this.posicion.x = 1;
    }
    
    if (this.posicion.x >= width - this.imagen.getWidthFrame()){
      this.posicion.x = width - this.imagen.getWidthFrame() - 1; 
    }
    
    if (this.posicion.y <= 0){
      this.posicion.y =1;
    }
    
    if (this.posicion.y >= height - this.imagen.getHeightFrame()){
      this.posicion.y = height - this.imagen.getHeightFrame() - 1;
    }
  }
  
  public void incrementarVelocidadAtaque(){
  }
  
  public void recolectarBonus(Bonus bonus){
  }
  
  
  /* Permite mostrar el Dragón en el escenario, y también muestra las vidas que posee actualmente. */
  public void display(){
    image(this.imagen.sprite.get(this.imagen.getXFrame(),this.imagen.getYFrame(),this.imagen.getWidthFrame(),this.imagen.getHeightFrame()),this.posicion.x,this.posicion.y);
    this.imagen.setXFrame(this.imagen.getXFrame() + this.imagen.getWidthFrame());
    
    if(this.imagen.getXFrame() >= this.imagen.sprite.width){
      this.imagen.setXFrame(0);
    }
   
    mostrarNivelVida();       //Se incova al método para mostrar el nivel de vida del personaje.
  }
  
  /* Muestra el nivel de vida del Dragón. */
  private void mostrarNivelVida(){
    PImage corazon = loadImage("resources/images/corazon.png");   //Se declara una variable para almacenar la imagen del nivel de vidas.
    corazon.resize(20,20);
    
    for (int i = 0; i < this.nivelVida; i++){                     //Se muestra el nivel de vida, en base al valor de contador de vidas.
      image(corazon,(i * 30),360);
    }
  }  
  
  /* Permite que el Dragón pueda disparar desde su pocision y
  para que siempre que dispare añada un disparo. */
  public void disparar(){
    if(mousePressed && mouseButton == LEFT){
      disparar.play();
    
     //aqui creo la posicion de donde quiero que salga el disparo 
    //agrego un disparo por cada click con el add(disparo)
    PVector pos = new PVector(this.posicion.x,this.posicion.y);
    
    // llamo a la clase disparo y le doy la direccion 
    Disparo disparo = new Disparo(pos,-20);
    disparo.display();
    disparosDragon.add(disparo);
   }
 } 
  

  /* Método que controla el nivel de vida del Dragón, verficando si colisiona
  con alguno de los enenemigos. */
  public void verificarVida(){
    Enemigo e;
    Disparo d;
    
    switch (nivel){
      case 1:{
        for (int i = 0; i < listaEnemigo1.size(); i++){    //Se recorre la lista de EnemigosNivel1.
          e = listaEnemigo1.get(i);
          
          //Se verifica si el Dragón colisiona con alguno de los elementos del ArrayList de EnemigosNivel1.
          if ((dist(this.posicion.x,this.posicion.y,e.posicion.x,e.posicion.y) <= 40) && !detectarColision){
            danio.play();
            ataqueEnemigo1.play();
            this.nivelVida--;                              //Se descuenta el contador de vidas al detectar una colisión con algún Enemigo.
            detectarColision = true;                       //Se activa una bandera que pemite controlar la colisión.
            this.recibirDanio();                           //Se muestra la animación de daño del Dragón al colisionar con EnemigoNive1.
        
            if (this.nivelVida <= 0){                      //Se activa la bandera de Fin de Juego.
              gameOver = true;
            }
          }
      
          if (e.posicion.y >= height){                    //Se desactiva la bandera, para la próxima ronda de EnemigosNivel1.
            detectarColision = false;
          }
        }
      }
      break;
      case 2:{
        for (int i = 0; i < listaEnemigo2.size(); i++){    //Se recorre la lista de EnemigosNivel2.
          e = listaEnemigo2.get(i);
          
          //Se verifica si el Dragón colisiona con alguno de los elementos del ArrayList de EnemigosNivel2.
          if ((dist(this.posicion.x,this.posicion.y,e.posicion.x,e.posicion.y) <= 40) && !detectarColision){
             danio.play();
             ataqueEnemigo1.play();
            this.nivelVida--;                              //Se descuenta el contador de vidas al detectar una colisión con algún Enemigo.
            detectarColision = true;                       //Se activa una bandera que pemite controlar la colisión.
            this.recibirDanio();                           //Se muestra la animación de daño del Dragón al colisionar con EnemigoNive2.
        
            if (this.nivelVida <= 0){                      //Se activa la bandera de Fin de Juego.
              gameOver = true;
            }
          }
      
          if (e.posicion.y >= height){                    //Se desactiva la bandera, para la próxima ronda de EnemigosNivel2.
            detectarColision = false;
          }
        }
        
        for (int i = 0; i < disparosE2.size(); i++){    //Se recorre la lista de Disparos de EnemigosNivel2.
          d = disparosE2.get(i);
          
          //Se verifica si el Dragón colisiona con alguno de los disparos de EnemigosNivel2.
          if ((dist(this.posicion.x,this.posicion.y,d.posicion.x,d.posicion.y) <= 35) && !detectarColision){
             danio.play();
             ataqueEnemigo1.play();
            this.nivelVida--;                              //Se descuenta el contador de vidas al detectar una colisión con algún Disparo.
            detectarColision = true;                       //Se activa una bandera que pemite controlar la colisión.
            this.recibirDanio();                           //Se muestra la animación de daño del Dragón al colisionar con un Disparo EnemigoNivel2.
        
            if (this.nivelVida <= 0){                      //Se activa la bandera de Fin de Juego.
              gameOver = true;
            }
          }
      
          if (d.posicion.y >= height){                    //Se desactiva la bandera, para la próxima ronda de disparos de EnemigosNivel2.
            detectarColision = false;
          }
        }
      }
      break;
      case 3:{
        for (int i = 0; i < listaEnemigo3.size(); i++){    //Se recorre la lista de EnemigosNivel3.
          e = listaEnemigo3.get(i);
          
          //Se verifica si el Dragón colisiona con alguno de los elementos del ArrayList de EnemigosNivel3.
          if ((dist(this.posicion.x,this.posicion.y,e.posicion.x,e.posicion.y) <= 40) && !detectarColision){
             danio.play();
             ataqueEnemigo1.play();
            this.nivelVida--;                              //Se descuenta el contador de vidas al detectar una colisión con algún EnemigoNivel3.
            detectarColision = true;                       //Se activa una bandera que pemite controlar la colisión.
            this.recibirDanio();                           //Se muestra la animación de daño del Dragón al colisionar EnemigoNive3.
        
            if (this.nivelVida <= 0){                      //Se activa la bandera de Fin de Juego.
              gameOver = true;
            }
          }
      
          if (e.posicion.y >= height){                    //Se desactiva la bandera, para la próxima ronda de EnemigosNivel3.
            detectarColision = false;
          }
        }
        
        for (int i = 0; i < disparosE3.size(); i++){    //Se recorre la lista de Disparos de EnemigosNivel3.
          d = disparosE3.get(i);
          
          //Se verifica si el Dragón colisiona con alguno de los disparos de EnemigosNivel2.
          if ((dist(this.posicion.x,this.posicion.y,d.posicion.x,d.posicion.y) <= 35) && !detectarColision){
             danio.play();
             ataqueEnemigo1.play();
            this.nivelVida--;                              //Se descuenta el contador de vidas al detectar una colisión con algún Disparo.
            detectarColision = true;                       //Se activa una bandera que pemite controlar la colisión.
            this.recibirDanio();                           //Se muestra la animación de daño del Dragón al colisionar con un Disparo de EnemigoNivel3.
        
            if (this.nivelVida <= 0){                      //Se activa la bandera de Fin de Juego.
              gameOver = true;
            }
          }
      
          if (d.posicion.y >= height){                    //Se desactiva la bandera, para la próxima ronda de disparos de EnemigosNivel3.
            detectarColision = false;
          }
        }
      }
      break;      
    }   
  }
  
  /* Muestra animación de daño del Dragón  cada vez
     que colsiona con una Enemigo. */
  public void recibirDanio(){
    int i;//Se realiza un recorrido por los Frames del Sprite de "recibirDanio" de la Clase.
    for (i = 0; i < this.recibirDanio.getCantFrames(); i += this.recibirDanio.getWidthFrame()){
      image(this.recibirDanio.sprite.get(this.recibirDanio.getXFrame(),this.recibirDanio.getYFrame(),this.recibirDanio.getWidthFrame(),this.recibirDanio.getHeightFrame()),this.posicion.x,this.posicion.y);
    }
  }
}
