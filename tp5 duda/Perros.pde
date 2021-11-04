class Perro {

  PImage [] img;
  float x, y, mov, dir, tam, tam2;
  boolean activo;
  float der, izq;
  int cantCuadross;
  int PosX = 550;

  Perro (float cy_) {
    x = random(0, 600);
    y = cy_;
    dir = random(2, 4);
    tam = 130;
    tam2 = 120;
    activo = true;
    mov = random(0.5, 1);
    der = x+tam;
    izq = x-tam;
    cantCuadross = 3;
    img = new PImage [cantCuadross];
    for (int i=0; i <cantCuadross; i ++) {
      img [i] =loadImage("perro/imgs_"+nf(i, 2)+".png");
    }
  }
  void dibujar() {
    image(img[(frameCount/5)%cantCuadross], PosX - x, y, tam, tam2);
    rect (PosX - x, y, tam, tam2);
  }


  void moverPerro(int nivel) {
    if (nivel==1) {
      dir *= 1;
    }


    if (x>der || x<izq) {
      mov *= -1;
    }

    if (x< 0) {

      x = width;
      y = random (50, 300);
      activo = true;
    }
    x += dir;
    x += mov;
    PosX = PosX-1;
  }
}
