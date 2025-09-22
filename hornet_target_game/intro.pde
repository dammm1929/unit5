int f = 0;

void intro() {
  image(gif[f], 0, 0, width, height);
  f += 1;
  if (f == frames) f = 0;
  
  strokeWeight(5);
  fill(255);
  tactile(400,400);
  rect(400,400,200,100);
  fill(0);
  textSize(70);
  text("Play", 435,475);
}



void show() {
  
  
  
  
}
