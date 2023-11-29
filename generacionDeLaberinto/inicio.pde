
int x = 200, y = 300, w = 200, h = 50;
// Escenas

//inicio
void inicio(){
  size(1600,900);
  image(fondoPrin,0,0);
  textAlign(CENTER);
  textFont(font);
  botons(550,400,400,50,2,"Play",50);
  botons(550,500,400,50,3,"Credits",50);
  botons(550,600,400,50,4,"Exit",50);
  //fill(255);
  //textSize(50);
  //text("Jugar", 300, 340);
}

//juego
void juego(){
        
        dibujarlab();
        smoothDraw();
        botons(1150,800,400,50,1,"Volver al inicio", 50);
        botons(1468,16,115,115,21,"", 5000);
        image(Reiniciar,1460,10);
        botons(1302,16,115,115,212,"", 5000);
        image(Bombilla,1295,10);
        textField.setVisible(false);
        textField2.setVisible(false);
        String nombre = textField .getText();
        println(nombre); 
  //fill(255);
  //textSize(50);
  //text("Jugar", 300, 340);
}

void nombreDimension(){
        size(1600,900);
        image(fondoNombre,0,0);
        textField.setVisible(true);
        textField2.setVisible(true);
        textField2.setNumeric(1,48,-1);
        n = textField2.getValueI();
        println(n);
        nombre = textField .getText();
        println(nombre); 
        botons(580,800,400,50,21,"Continuar", 50);
  //fill(255);
  //textSize(50);
  //text("Jugar", 300, 340);
}


void creditos(){
       size(1600,900);
       image(fondoCredits,0,0);
       botons(1150,800,400,50,1,"Volver", 50);
  //fill(255);
  //textSize(50);
  //text("Jugar", 300, 340);
}
//subrutina para agregar botones
void botons(int x, int y, int w, int   h, int window, String texto, int r){
  if ((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y + h)) {
      fill(#A15CBF);
      if (mousePressed == true) {
        op = window;
      }
    } else {
      fill(#612F77);
    }
    
    rect(x,y,w,h,r);
    fill(255);
    textSize(50);
    text(texto, x + 200, y + 45);
}

//subrutina para caja de texto(texlField)
void handleTextEvents(GTextField textField, GEvent event) {
  if (event == GEvent.ENTERED) {
    String nombre = textField.getText();
    println("Usuario: " + nombre);
  }
}
