class Bonus {
  private PImage imagen;
  private PVector posicion;
  private String bonificacion;
  private boolean visible;
  private Dragon dragon;
  private boolean bandera = true;
  
  //contructor del bonus 
  public Bonus (Dragon dragon){
    this.posicion = new PVector(-100,-100);
    this.imagen =loadImage("resources/images/corazon.png");
      imagen.resize(20,20);
      this.dragon = dragon;
  }

  public void display(){
 switch(puntos){
   case 5:
   
    image(imagen,this.posicion.x ,this.posicion.y );
    if(bandera){
      this.posicion.x = random(1,596);
      this.posicion.y = random(1,396);
     // bandera = true;
    print("bonus1");
    }
    
   break; 
    
     case 10:
   this.imagen =loadImage("resources/images/ataque.png");
      imagen.resize(20,20);
      
    image(imagen,this.posicion.x ,this.posicion.y );
    if(bandera){
      this.posicion.x = random(1,596);
      this.posicion.y = random(1,396);
      //bandera = false;
    print("bonus2");
    }
    
    break;
    
  }
  
 comerBonus();
 
 
}

  // el dragon come la vida 
  public void comerBonus(){
  if ((dist(this.posicion.x,this.posicion.y,dragon.posicion.x,dragon.posicion.y) <= 20) && !detectarColision){
    this.posicion.x = -100;
    this.posicion.y = -100;
      bandera = true;
  }
  if(puntos == 5 || puntos ==10){
  
    bandera = false;
  }
  else{
  
  }
  }
  
  
}
