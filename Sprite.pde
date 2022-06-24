class Sprite{
private PImage sprite;
private int widthFrame,heightFrame,xFrame,yFrame,cantFrames,contFrames;  // ancho,alto del frame, posicion de inicio
                                                                         //cantidad de frames
protected PVector posicion = new PVector();


//Constructor por defecto.
public Sprite(){
}

//Constuctor parametrizado.
public Sprite(String rutaSprite, int widthFrame,int heightFrame, int cantFrames, PVector posicion){
  this.posicion = posicion;
  this.sprite= requestImage(rutaSprite);
  this.widthFrame = widthFrame;
  this.heightFrame = heightFrame;
  this.xFrame = 0;
  this.yFrame = 0;
  this.cantFrames = cantFrames;
  contFrames = 1;
  frameRate(12);
}

/* Devuelve el ancho del frame */
public int getWidthFrame(){
  return this.widthFrame;
}

/* Devuelve el alto del frame */
public int getHeightFrame(){
  return this.heightFrame;
}

/* Devuelve la coordenada x del frame */
public int getXFrame(){
  return this.xFrame;
}

/* Asigna la coordena x al frame */
public void setXFrame(int xF){
  this.xFrame = xF;
}

/* Devuelve la coordenada y del frame */
public int getYFrame(){
  return this.yFrame;
}

/* Devuelve la cantidad de frames del Sprite */
public int getCantFrames(){
  return this.cantFrames;
}

/* Devuelve el contador de frames del Sprite */
public int getContFrames(){
  return this.contFrames;
}

/* Asigna unas coordenadas determinada al Sprite */
public void setPosicion(PVector posicion){ 
  this.posicion = posicion;

}

/* Devuelve las coordenadas del Sprite */
public PVector getPosicion(){
  return this.posicion;
}

/*
  muestra la imagen png frame por frame segun el ancho y 
  alto del frame y la visualiza en la posicion indicada
*/
public void display(){
  //imageMode(CENTER);  
    image(sprite.get(xFrame,yFrame,widthFrame,heightFrame),this.posicion.x,this.posicion.y);
    xFrame = xFrame + widthFrame;
    if(xFrame >= sprite.width){
      xFrame = 0;     
  }
}


}
