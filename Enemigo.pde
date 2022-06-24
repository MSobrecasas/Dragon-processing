class Enemigo{
  protected Sprite imagen;
  protected PVector posicion;
  //protected int nivelVida;
  protected Sprite ataque;
  
  public Enemigo(){}
  
  /* Método que se encarga de mostrar la Lista de Enemigos */
  public void display(){
    textSize(20);
    text("ENEMIGOS " + puntos,450,380);  // Se muestra el Contador Enemigos destruídos.
    text("NIVEL " + nivel,500,36);       // Se muestra el Nivel del Juego.
    
    
    verificarVida();//verificar enemigos muerto 
    
    //Se cargan los frames del Sprite para producir la animación.
    image(this.imagen.sprite.get(this.imagen.getXFrame(),this.imagen.getYFrame(),this.imagen.getWidthFrame(),this.imagen.getHeightFrame()),this.posicion.x,this.posicion.y);
   
    //Se actualiza el frame para mostrar la animación del Sprite
    this.imagen.setXFrame(this.imagen.getXFrame() + this.imagen.getWidthFrame());
   
    //Si se llega al último frame, se vuelve al frame inicial del Sprite.
    if(this.imagen.getXFrame() >= this.imagen.sprite.width){
      this.imagen.setXFrame(0);     
    }  
  }
  
  /* Método que se encarga de mover los Enemigos
  en sentido vertical hacia arriba*/
  public void mover(){
    this.posicion.y -= 5;
    
    if (this.posicion.y <= 0) {
      this.posicion.y = height;
    }
  }
  
  public void verificarVida(){}
   
  public  void atacar(){}
  
  public void crearListaEnemigos(){}
  
  public void mostrarListaEnemigos(){}
  
}
