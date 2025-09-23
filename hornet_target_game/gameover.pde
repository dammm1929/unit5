void gameover() {
  background(#DE3F3F);
  textSize(100);
  text("your lost", 200,400);
  music.pause();
  strokeWeight(5);
  fill(255);
  tactileLose(600,500);
  stroke(0);
  rect(600,500,200,100);
  fill(0);
  textSize(40);
  text("tried again", 610,565);
}
