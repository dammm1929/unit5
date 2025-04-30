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
float x, y,  //position
      d;     //diameter
      
float x2, y2;

// key variables
boolean wkey,akey,skey,dkey; //false by default
boolean upkey,leftkey,downkey,rightkey;

//gravity
//float ax, ay;
  //vx += ax;
  //vy += ay;


void setup() {
  size(600,600, P2D);
  frameRate(120);
  ballx = 300;
  bally = 200;
  balld = 50;
  vx = 3;
  vy = -2;
  x = 200;
  y = height/2;
  d = 100;
  x2 = 400;
  y2 = height/2;
}

void draw() {
  background(red);
  fill(blue);
  circle(x,y,d);
  fill(green);
  circle(x2,y2,d);
  strokeWeight(4);
  stroke(255);
  
  if (wkey) y -= 2.5;
  if (akey) x -= 2.5;
  if (skey) y += 2.5;
  if (dkey) x += 2.5;
  
  if (upkey) y2 -= 2.5;
  if (leftkey) x2 -= 2.5;
  if (downkey) y2 += 2.5;
  if (rightkey) x2 += 2.5;
  
  fill(orange);
  circle(ballx, bally, balld);
  
  ballx += vx;
  bally += vy;
  
  if (bally <= balld/2) { //top
    vy *= -0.95;
    bally = balld/2;
  }
  
  if (bally >= height-balld/2) { //bottom
    vy *= -0.95;
    bally = height-balld/2;
  }
  
  if (ballx <= balld/2) { //right
    vx *= -0.95;
    ballx = balld/2;
  }
  
  if (ballx >= width-balld/2) { //left
    vx *= -0.95;
    ballx = width - balld/2;
  }
  
  
  if (dist(x, y, ballx, bally) <= d/2 + balld/2 || dist(x2, y2, ballx, bally) <= d/2 + balld/2) {
    vx = vy = 0;
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
