void game() {
  background(#81807F);
  fill(0);
  rect(-10,750, 1020,250);
  player1();
  player2();
  ball();
  vx += ax;
  vy += ay/1.5; //how hard characters hit the ball

  
  strokeWeight(4);
  stroke(255);
  fill(255);
  textSize(50);
  text("score", 445,70);
  text(score1, 400,70);
  text(score2, 580, 70);
  
  
  if (player1y < 700) { //player 1 movement (jump)
    vy1 += ay;
    player1y += vy1;
  }
  if (player1y > 700) {
    player1y = 700;
  }
  
  if (wkey && player1y == 700) { //left and right
    vy1 = -5;
    player1y -= 1;
  }
  
  if (akey && player1x > 50) { // vx1 = 0.1 btw
    player1x -= vx1;
    if (vx1 <= 2.5) vx1 *= 1.06;
  }
  else {
    //if (vx1 > 0) vx1 -= 0.1;
    vx1 = 0.3;
  }
  
  if (dkey && player1x < 430) {
    player1x += vx2;
    if (vx2 <= 2.5) vx2 *= 1.06;
  }
  else {
    vx2 = 0.3;
  }
  
  //DASHING
  if (vx1 > 2.5) {
    vx1 -= 0.8;
  }
  if (vx2 > 2.5) {
    vx2 -= 0.8;
  }
  if (vx1p2 > 2.5) {
    vx1p2 -= 0.8;
  }
  if (vx2p2 > 2.5) {
    vx2p2 -= 0.8;
  }



  if (player2y < 700) { //player 2 movement (jump)
    vy2 += ay;
    player2y += vy2;
  }
  if (player2y > 700) {
    player2y = 700;
  }
  if (upkey && player2y == 700) {
    vy2 = -5;
    player2y -= 1;
  }
  
  if (leftkey && player2x > 570) {
    player2x -= vx1p2;
    if (vx1p2 <= 2.5) vx1p2 *= 1.06;
  }
  else {
    vx1p2 = 0.2;
  }
    
  if (rightkey && player2x < 950) {
    player2x += vx2p2;
    if (vx2p2 <= 2.5) vx2p2 *= 1.06;
  }
  else {
    vx2p2 = 0.2;
  }
  

  if (dist(player1x, player1y, ballx, bally) <= d/2 + balld/2 && bally <= 720) { //collision on ball
    vx = (ballx - player1x)/20;
    vy = (bally - player1y)/10;

  }
  
  if (dist(player2x, player2y, ballx, bally) <= d/2 + balld/2 && bally <= 720) {
    vx = (ballx - player2x)/20;
    vy = (bally - player2y)/10;
  }
  

  
  boolean hit = ballnet(ballx, bally, balld, sx, sy, sw); 
  if (hit && ballx < sx) {
    vx *= -0.99;
  }
  if (hit && ballx > sx+sw) {
    vx *= -0.99;
  }
  
  if (hit && bally < sy) {
    vy *= -0.99;
  }
  fill(#A7A7A7);
  rect(sx, sy, sw, sh-50);
    
}

void player1() { //bron
  strokeWeight(4);
  noStroke();
  fill(#7C4E20); //ligher brown
  ellipse(player1x-50, player1y-5, 20,30); //ears
  ellipse(player1x+50, player1y-5, 20,30);
  fill(#311E0C); //hair
  circle(player1x, player1y,d);
  fill(#7C4E20); //ligher brown
  ellipse(player1x, player1y-10, 95,70);
  fill(#F7F7F7);
  ellipse(player1x-20, player1y-15, 15,6); //eyes
  ellipse(player1x+20, player1y-15, 15,6);
  fill(#0D0700);
  ellipse(player1x-20, player1y-15, 8,8); //pupils
  ellipse(player1x+20, player1y-15, 8,8);
  fill(#7C4E20);
  ellipse(player1x-20, player1y-9, 25,8); //eyelid
  ellipse(player1x+20, player1y-9, 25,8);
  fill(#311E0C); //brow left
  ellipse(player1x-20, player1y-25, 18,5);
  fill(#7C4E20);
  ellipse(player1x-20, player1y-22, 18,5);
  fill(#311E0C); //brow right
  ellipse(player1x+20, player1y-25, 18,5);
  fill(#7C4E20);
  ellipse(player1x+20, player1y-22, 18,5);
  fill(#F7F7F7);
  ellipse(player1x, player1y+10, 30,20); //smile
  fill(#7C4E20);
  ellipse(player1x, player1y+4, 55,20);
  fill(#593B1D); //nostril shade
  ellipse(player1x-7,player1y+5, 6,6);
  ellipse(player1x+7,player1y+5, 6,6);
  stroke(#67421D);
  fill(#67421D);
  triangle(player1x,player1y-10, player1x-7,player1y+5, player1x+7,player1y+5);
  stroke(#311E0C);
  line(player1x-13,player1y+9, player1x,player1y+8); //stache
  line(player1x,player1y+8, player1x+13,player1y+9);
}

void player2() {
  stroke(#f2bfa0);
  strokeWeight(22);
  noFill();
  image(omni,player2x-35,player2y-35, 70,70);
  circle(player2x,player2y,d-22);

}

void ball() {
  fill(#FA9B00);
  strokeWeight(4);
  circle(ballx, bally, balld);
  
  ballx += vx;
  bally += vy;
  
  if (bally <= balld/2) { //top ceiling
    vy *= -0.99;
    bally = balld/2;
  }
  
  if (ballx <= balld/2) { //right wall
    vx *= -0.99;
    ballx = balld/2;
  }
  
  if (ballx >= width-balld/2) { //left wall
    vx *= -0.99;
    ballx = width - balld/2;
  }
  
  if (bally >= 750-balld/2 && ballx < width/2) { //left side point trigger
    vy = 0;
    vx = 0;
    bally = 750-balld/2;
    score2 = score2M + 1;
    pause += 1;
    if (pause >= 150) {
      ballx = 750;
      bally = 200;
      vx = 0;
      vy = -2;
      score1M = score1;
      score2M = score2;
      pause = 0;
      player1x = 250;
      player1y = 700;
      player2x = 750;
      player2y = 700;
    }
  }
  
  if (bally >= 750-balld/2 && ballx > width/2) { //right side point trigger
    vy = 0;
    vx = 0;
    bally = 750-balld/2;
    score1 = score1M + 1;
    pause += 1;
    if (pause >= 150) {
      ballx = 250;
      bally = 200;
      vx = 0;
      vy = -2;
      score1M = score1;
      score2M = score2;
      pause = 0;
      player1x = 250;
      player1y = 700;
      player2x = 750;
      player2y = 700;
    }
  }
  
  if (score1 == 3) {
    mode = GAMEOVER;
    
  }
  
}




void gameClicks() {
  mode = PAUSE;

}
