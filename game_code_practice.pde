color red = #FFADAD;
color orange = #FFD6A5;
color yellow = #FDFFB6;
color green = #CAFFBF;
color cyan = #9BF6FF;
color blue = #A0C4FF;
color purp = #BDB2FF;

float ballx, bally, balld;
float vx, vy;
float ax, ay;

// target
float player1x, player1y,  //position
      d;     //diameter
      
float player2x, player2y;

// key variables
boolean wkey,akey,skey,dkey; //false by default
boolean upkey,leftkey,downkey,rightkey;

float sx = 480;
float sy = 450;
float sw = 40;
float sh = 350;
float pause = 0;

int score1;
int score1M;
int score2;
int score2M;


void setup() {
  size(1000,800);
  frameRate(120);
  ballx = 250;
  bally = 200;
  balld = 50;
  vx = 0;
  vy = -0.5;
  player1x = 250;
  player1y = 700;
  d = 100;
  player2x = 750;
  player2y = 700;
  
  ax = 0;
  ay = 0.1;
  
  score1M = score1;
  score2M = score2;

  
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
  fill(#F2C7A0);
  strokeWeight(4);
  noStroke();
  circle(player2x,player2y,d);
}

void ball() {
  fill(#FA9B00);
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
  
  if (bally >= height-balld/2 && ballx < width/2) { //left side point trigger
    vy = 0;
    vx = 0;
    bally = height-balld/2;
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
    }
  }
  
  if (bally >= height-balld/2 && ballx > width/2) { //right side point trigger
    vy = 0;
    vx = 0;
    bally = height-balld/2;
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
    }
  }
}

void draw() {
  background(#81807F);
  player1();
  player2();
  ball();
  strokeWeight(4);
  stroke(255);
  fill(255);
  textSize(50);
  text("score", 445,70);
  text(score1, 400,70);
  text(score2, 580, 70);
  
  vx += ax;
  vy += ay/2;
  if (wkey) player1y -= 2.5;
  if (akey) player1x -= 2.5;
  if (skey) player1y += 2.5;
  if (dkey) player1x += 2.5;
  
  if (upkey) player2y -= 2.5;
  if (leftkey) player2x -= 2.5;
  if (downkey) player2y += 2.5;
  if (rightkey) player2x += 2.5;
  

  if (dist(player1x, player1y, ballx, bally) <= d/2 + balld/2) {
    vx = (ballx - player1x)/20;
    vy = (bally - player1y)/10;

  }
  
  if (dist(player2x, player2y, ballx, bally) <= d/2 + balld/2) {
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
  rect(sx, sy, sw, sh);
    
    
  
}


boolean ballnet(float cx, float cy, float r, float rx, float ry, float rw) {
  float testX = cx;
  float testY = cy;
  
  if (cx < rx)         testX = rx;     
  else if (cx > rx+rw) testX = rx+rw;   
  if (cy < ry)         testY = ry;  
  
  float distX = cx-testX;
  float distY = cy-testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  if (distance <= r/2) {
    return true;
  }
  return false;
}

void keyPressed() {
  if (key == 'w') wkey = true;
  if (key == 'a') akey = true;
  if (key == 's') skey = true;
  if (key == 'd') dkey = true;
  
  if (keyCode == UP) upkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == RIGHT) rightkey = true;
}

void keyReleased() {
  if (key == 'w') wkey = false;
  if (key == 'a') akey = false;
  if (key == 's') skey = false;
  if (key == 'd') dkey = false;
  
  if (keyCode == UP) upkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == RIGHT) rightkey = false;
}
