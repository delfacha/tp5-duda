class Fondo {
  int numFondo;
  float x;
  float velx;
  int cant = 5; // cant de fondos
  PImage [] fondos = new PImage[cant];
  Fondo() {
    for (int i=0; i<cant; i++) {
      fondos[i] = loadImage("pantalla"+i+".png");
    }
    x = 0;
    velx=-1;
  }
  void dibujar(int numFondo_) { 
    numFondo = numFondo_;
    image(fondos[numFondo], x, 0, width, height);
    image(fondos[numFondo], width + x, 0, width, height);
    if (numFondo>1 && numFondo<3 ) {//&& moverFondo) {
      rectMode(CENTER);
      x+=velx;
      if (x<-width) {
        x=0;
      }
    }
  }
}
