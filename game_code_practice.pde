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




void setup() {
  size(600,600);
  frameRate(120);
  ballx = 300;
  bally = 200;
  balld = 50;
  vx = 2;
  vy = -1.5;
  player1x = 200;
  player1y = height/2;
  d = 100;
  player2x = 400;
  player2y = height/2;
  
  ax = 0;
  ay = 0.1;

  
}

void draw() {
  background(red);
  fill(blue);
  circle(player1x,player1y,d);
  fill(green);
  circle(player2x,player2y,d);
  strokeWeight(4);
  stroke(255);
  vx += ax;
  vy += ay/5;
  if (wkey) player1y -= 2.5;
  if (akey) player1x -= 2.5;
  if (skey) player1y += 2.5;
  if (dkey) player1x += 2.5;
  
  if (upkey) player2y -= 2.5;
  if (leftkey) player2x -= 2.5;
  if (downkey) player2y += 2.5;
  if (rightkey) player2x += 2.5;
  
  fill(orange);
  circle(ballx, bally, balld);
  
  ballx += vx;
  bally += vy;
  
  if (bally <= balld/2) { //top
    vy *= -0.99;
    bally = balld/2;
  }
  
  if (bally >= height-balld/2) { //bottom
    vy *= -0.99;
    bally = height-balld/2;
  }
  
  if (ballx <= balld/2) { //right
    vx *= -0.99;
    ballx = balld/2;
  }
  
  if (ballx >= width-balld/2) { //left
    vx *= -0.99;
    ballx = width - balld/2;
  }
  
  
  if (dist(player1x, player1y, ballx, bally) <= d/2 + balld/2) {
    vx = (ballx - player1x)/40;
    vy = (bally - player1y)/20;

  }
  
  if (dist(player2x, player2y, ballx, bally) <= d/2 + balld/2) {
    vx = (ballx - player2x)/40;
    vy = (bally - player2y)/20;
  }
  
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
