void gameover() {

  if (score1 == 3) {
    text("player 1 wins", 100,100);
  }
  if (score2 == 3) {
    text("player 2 wins", 600,100);
  }
}

void gameoverClicks() {
  mode = GAME;
}
