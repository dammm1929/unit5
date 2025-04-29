color red = #FFADAD;
color orange = #FFD6A5;
color yellow = #FDFFB6;
color green = #CAFFBF;
color cyan = #9BF6FF;
color blue = #A0C4FF;
color purp = #BDB2FF;

// target
float x, y,  //position
      d;     //diameter
      
float x2, y2;

// key variables
boolean wkey,akey,skey,dkey; //false by default
boolean upkey,leftkey,downkey,rightkey;

void setup() {
  size(600,600);
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
  
  if (wkey) y -= 5;
  if (akey) x -= 5;
  if (skey) y += 5;
  if (dkey) x += 5;
  
  if (upkey) y2 -= 5;
  if (leftkey) x2 -= 5;
  if (downkey) y2 += 5;
  if (rightkey) x2 += 5;
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
