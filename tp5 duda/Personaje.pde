class Gato {
  int px, py, tam, x;
  int cantCuadros;
  PImage [] img;
  Gato (int px_, int py_, int tam_) {
    px = px_;
    py = py_;
    tam = tam_;
    cantCuadros = 6;
    img = new PImage [cantCuadros];
    for (int i=0; i <cantCuadros; i ++) {
      img [i] =loadImage("gato/img_"+nf(i, 2)+".png");
    }
  }
  void dibujar() {
    image(img[(frameCount/5)%cantCuadros], px, py, tam*2, tam*2);
    rect (px, py, tam*2, tam*2);
  }
  void moverArriba() {
    if (px<width-tam/2) {
      py += 5;
    }
  }
  void moverAbajo() {
    if (px>tam/2) {
      py -= 5;
    }
  }
}
