//Se declara el la Lista de EnemigosNivel3.
ArrayList <EnemigoNivel3> listaEnemigo3;

class EnemigoNivel3 extends Enemigo{
  
  //Constructor por Defecto.
  public EnemigoNivel3(){
  }
  
  //Constructor Parametrizado.
  public EnemigoNivel3(Sprite sprite) {
    this.imagen = sprite;
    this.posicion = sprite.getPosicion();
  }  
    
  
  /* Método que verifica si existe una colisión entre un disparo Dragón 
  con algún EnemigoNivel3 de la lista. Si ocurre, éste desaparece. */
  public void verificarVida(){
   Disparo ataque;
   EnemigoNivel3 e;
   
   
   //Se recorre la lista de Disparos del Dragón.
   for (int i = 0; i < disparosDragon.size(); i++){
     ataque = disparosDragon.get(i);
     
     //Para cada EnemigoNivel2 de la lista se comprueba si recibe un disparo.
     for (int j = 0; j < listaEnemigo3.size(); j++){
       e = listaEnemigo3.get(j);
       
       if (dist(ataque.posicion.x,ataque.posicion.y,e.posicion.x,e.posicion.y) <= 20){
         e.posicion.x = random(0, 396);  //Se le asigna una coordenada X aleatoria en el lienzo, simulado que es otro enemigo que aparece.
         e.posicion.y = height;          //Se reinicia la coordenada Y del enemigo muerto para que vuelva a desplazarse hacia arriba como un nuevo enemigo. 
         puntos++;                       //Se incrementa el Contador de Puntos.
       }
     }
   }
  }
    
  /* Se instancian los objetos (5) de la Clase EnemigoNivel3, y 
  se almacenan en el ArrayList.*/
  public void crearListaEnemigos(){
    EnemigoNivel3 e;
    
    //Se agregan a la lista, 5 objetos de la Clase EnemigosNivel3.
    for (int i = 0; i < 5; i++){
      //Se instancia objeto de la Clase EnemigosNivel3.
      e = new EnemigoNivel3(new Sprite("resources/images/enemigo3.png", 50, 50, 4, new PVector((i * 120), 430)));
      listaEnemigo3.add(e);  //Se agrega a la Lista de EnemigosNivel3.
    }    
  }

  /* Se muestran los enemigos del ArrayList EnemigoNivel3 
   y su avance en el escenario. */
  public void mostrarListaEnemigos(){
    EnemigoNivel3 e;
    
    //Se recorre la Lista de EnemigosNivel3.
    for (int i = 0; i < listaEnemigo3.size(); i++){
      e = listaEnemigo3.get(i);
      
      //Si el EnemigoNivel3 se encuentra en algua de estas coordenadas "Y", realiza un disparo.
      if ((e.posicion.y == 341) || (e.posicion.y == 342) || (e.posicion.y == 343) || (e.posicion.y == 344) || (e.posicion.y == 345)){
        e.atacar(e.posicion);
      }
      
      e.display();    //Se muestra EnemigoNivel3.
      
      e.mover();      //Se realiza el desplazamiento de EnemigoNivel3.
    }
  }
  
  /* Se instancian los Disparos de EnemigoNivel3 y se
  agregan a la lista de Disparos correspondiente. */
  public void atacar(PVector posEnemigo){
    Disparo dE;
    
    //Se instancia un objeto de la Clase Disparos. Y se emplea el Constructor Parametrizado correspondiente.
    dE = new Disparo(new PVector(posEnemigo.x,posEnemigo.y),10,3);
    
    disparosE3.add(dE);   //Se agrega a la lista de Disparos de EnemigosNivel3;
    
    dE.mostrarDisparosE();    //Se muestra el Disparo de EnemigoNivel3.
    dE.moverDisparoE();       //Se realiza el desplazamiento de Disparo de EnemigoNivel3.
 }

  /* Método que reinicia las coordenadas "Y" de Lista de EnemigosNivel3
  al llegar límite superior del lienzo. */
  public void reiniciarPosiciones(){
    for (int i = 0; i < listaEnemigo3.size(); i++){
      listaEnemigo3.get(i).posicion.y = 430;
    }
  }

}
