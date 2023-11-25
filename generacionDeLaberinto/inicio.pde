
int x = 200, y = 300, w = 200, h = 50;
// subrutina de la pantalla principal
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
