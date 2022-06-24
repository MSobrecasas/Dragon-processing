ArrayList <EnemigoNivel1> listaEnemigo1;

class EnemigoNivel1 extends Enemigo{
  
  //Constructor por Defecto.
  public EnemigoNivel1(){
  }
  
  //Constructor Parametrizado.
  public EnemigoNivel1(Sprite sprite) {
    this.imagen = sprite;
    this.posicion = sprite.getPosicion();
  }
  
  /* Este enemigo no realiza un ataque especial, simplemente ataca al desplazarse. */
  public void atacar(){
    //Simplemente se carga el mismo Sprite de EnemigoNivel1 al Sprite de ataque, pero realiza otra animación de ataque.
    this.ataque = this.imagen;    
  }  
  
  /* Método que verifica si existe una colisión entre un disparo Dragón 
  con algún EnemigoNivel1 de la lista. Si ocurre, éste desaparece. */
  public void verificarVida(){
   Disparo ataque;
   
   //Se recorre la lista de Disparos del Dragón.
   for (int i = 0; i < disparosDragon.size(); i++){
     ataque = disparosDragon.get(i);
     
     //Para cada EnemigoNivel1 de la lista se comprueba si recibe un disparo.
     for (EnemigoNivel1 e:listaEnemigo1){
       if (dist(ataque.posicion.x,ataque.posicion.y,e.posicion.x,e.posicion.y) <= 20){
         e.posicion.x = random(0, 396);  //Se le asigna una coordenada X aleatoria en el lienzo, simulado que es otro enemigo que aparece.
         e.posicion.y = height;          //Se reinicia la coordenada Y del enemigo muerto para que vuelva a desplazarse hacia arriba como un nuevo enemigo. 
         puntos++;                       //Se incrementa el Contador de Puntos.
       }     
     }         
   }
  }
    
  /* Se instancian los objetos (5) de la Clase EnemigoNivel1, y 
  se almacenan en el ArrayList. */
  public void crearListaEnemigos(){
    EnemigoNivel1 e;
   
    //Se agregan a la lista, 5 objetos de la Clase EnemigosNivel1.
    for (int i = 0; i < 5; i++){
      e = new EnemigoNivel1(new Sprite("resources/images/enemigo1.png", 45, 50, 4, new PVector((i * 120), 430)));
      listaEnemigo1.add(e);            
    }
  }

  /* Se muestran los enemigos del ArrayList EnemigoNivel1 
   y su avance en el escenario. */
  public void mostrarListaEnemigos(){
    EnemigoNivel1 e;
  
    for (int i = 0; i < listaEnemigo1.size(); i++){
      e = listaEnemigo1.get(i);
      e.display();
      e.mover();
    }
  }

  /* Método que obtiene la Lista de Enemigos de Nivel 1 */
  public ArrayList traerLista(){
    return listaEnemigo1;
  }

  /* Método que reinicia las coordenadas Y de Lista de Enemigos de Nivel 1
  al llegar límite superior del lienzo. */
  public void reiniciarPosiciones(){
    for (int i = 0; i < listaEnemigo1.size(); i++ ){
      listaEnemigo1.get(i).posicion.y = 430;
    }
  }    
}
