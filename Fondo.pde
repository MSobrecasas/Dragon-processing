class Fondo{
  
  private int alto, ancho, pos1, pos2;
  private PImage[] imagenes; 
  
  public Fondo(int ancho, int alto){
    this.alto = alto;
    this.ancho = ancho;
    pos1 = 0;
    pos2 = -alto;
    imagenes = new PImage[3];
    //Fondo nivel 1
    imagenes[0] = loadImage("resources/images/fondo1v1.png");
    imagenes[0].resize(ancho,alto);
    //Fondo nivel 2
    imagenes[1] = loadImage("resources/images/fondo2.png");
    imagenes[1].resize(ancho,alto);
    //Fondo nivel 3
    imagenes[2] = loadImage("resources/images/fondo3.png");
    imagenes[2].resize(ancho,alto);
  }
  /*
    Segun el nivel pasado por parametro llama a la funcion
    setFondo, en caso de mandar una opcion incorrecta 
    pone el fondo del nivel 0
  */
  public void display(int nivel){
    switch (nivel){
          case 1:
                 setFondo(0);
                 break;
          case 2:
                 setFondo(1);
                 break;
          case 3:
                 setFondo(2);
                 break;
          default:
                 setFondo(0);
                  break;
    }
  }
  /*
    muestra el fondo segun el nivel, de manera que parece gira 
    hacia abajo
  */
  private void setFondo(int img){
    image(imagenes[img],0,pos1);
    image(imagenes[img],0,pos2);
    pos1++;
    pos2++;
    if( pos1 == alto){
      pos1 = -alto;
    }
    if( pos2 == alto){
      pos2 = -alto;
    }
  }
}
