void intro() {
  background(#81623C);
  tactile(400,500,200,100);
  rect(400,500,200,100);
  textSize(70);
  fill(0);
  text("Play", 435,575);
}

void introClicks() {
  if (mouseX > 400 && mouseX < 600 && mouseY > 500 && mouseY < 600) mode = GAME;
}

void tactile(int x, int y, int w, int  h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(#8E8E8E);
  } else {
    fill(#D8D6D6);
  }
}
