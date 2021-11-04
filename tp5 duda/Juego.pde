class Juego {
  int contador;
  int nivel;
  String estado;
  Fondo fondo;
  Gato gatito;
  Perro [] perro;
  int cant;
  int pantalla;
  int segundos;
  PFont font;

  Juego(int cant_) {
    estado = "intro";
    cant = cant_;
    gatito = new Gato(width/2, height- 100, 50);
    perro = new Perro [cant];
    fondo = new Fondo();
    for (int i=0; i<cant; i++) {
      perro[i] = new Perro (i*80+10);
      font = createFont ("FreePixel.ttf", 30);
    }
  }
  void dibujarJuego() {

    fondo.dibujar(pantalla);

    if (estado.equals("intro")) {
      pantalla = 0;
      fill(100, 50, 70);
      rect(width-335, height-110, 170, 50);
      fill (255);
      textFont(font);
      text ("continuar", 182, 324);
      textSize (34);
    }
    if (estado.equals("ENTER")) {
      pantalla = 1;
      nivel = 1;
    }

    if (estado.equals("jugando")) {
      segundos++;
      chocar();

      gatito.dibujar();

      for (int i=0; i<cant; i++) {
        perro[i].dibujar();
        perro[i].moverPerro(nivel);
      }
      fill(255);
      textSize(30);
      text(contador, width-50, 50);

      if (segundos>900) { // en diez segundos cambia el fondo
        pantalla = 2;
        nivel = 2;
      }
    }
    if (contador>5) {
      estado = "PERDIO";
      segundos = 0;
    }
    if (estado.equals("PERDIO")) {
      pantalla = 3;
    }


    if (segundos> 2000) {
      estado= "GANO";
      segundos = 0;
    }
    if (estado.equals("GANO")) {
      pantalla = 4;
    }

    println("Estado Juego: "+ estado + " está FONDO numero: " + pantalla);
    println("SEGUNDOS "+ segundos + " NIVEL " + nivel);
  }

  void chocar() {
    for (int i=0; i<cant; i++) {
      boolean chocan = dist(perro[i].x, perro[i].y, gatito.px, gatito.py) < gatito.tam/4+perro[i].tam/4;


      if (chocan  && perro[i].activo) {
        contador++;
        perro[i].activo = false;
      }
    }
  }

  void moverGato(int tecla_) {
    int tecla = tecla_;
    if (tecla==DOWN) {
      gatito.moverArriba();
    }
    if (tecla==UP) {
      gatito.moverAbajo();
    }
  }

  void instrucciones() {
    if (mouseX>width-335 && mouseY >height-110 && estado.equals("intro")) {
      estado = "ENTER";
    }
  }

  void comenzar(int tecla) {
    //valores iniciales de arranque
    if (tecla==ENTER && estado != "jugando") {
      estado = "jugando";
      pantalla = 2;
      segundos = 0;
      contador = 0;
      nivel = 1;
      for (int i=0; i<cant; i++) {
        perro[i] = new Perro (i*80+10);
      }
    }
  }
}
