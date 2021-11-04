Juego juego;

void setup() {
  size(500, 400);
  juego = new Juego(5);
}
void draw() {
  juego.dibujarJuego();

  if (keyPressed) {
    juego.moverGato(keyCode);
  }
}
void keyPressed() {
  juego.comenzar(keyCode);
}
void mousePressed() {
  juego.instrucciones();
}
