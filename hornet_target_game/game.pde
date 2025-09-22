float hornetx = 150;
float hornety = 530;
float hornetwidth = 35;
float hornetheight = 70;
float vy;
float ay = 0.1;

float targetsiny = 0;
float targetsinx = 0;

float targetx;
float targety;

float daggerx;
float daggery;

int stage = 1;

float movetimer = 0;
float targetsize = 1;
boolean hitanimation = false;
float whitetimer = 0;
float hitcolourR = 240;
float hitcolourG = 99;
float hitcolourB = 102;

boolean coordsSet;

int misses = 0;

void game() {
  background(#9B7B8B);
  hornet();
  ground();
  vy += ay*1.6;

  
  if (hornety < 530) { // start falling
    vy += ay;
    hornety += vy*1.9;
  }
  if (hornety > 530) { // dont fall thru the ground
    hornety = 530;
  }
  if (jump && hornety == 530) {
    vy = -10;
    hornety -= 1; // get off the ground failsafe
  }
  
  if (chuck == true) {
    dagger();
    daggerx += 40;
  }
  
  if (stage == 1) {
    targetx = 800;
    targety = 210;
    target();
  }
  
  if (stage >= 2 && stage <= 5) {
    targetx = targx[stage];
    targety = targy[stage];
    target();
  }
  
  
  if (stage >= 6 && coordsSet == false) { // so the random coords are set and don't stay there
    targetx = targx[stage];
    targety = targy[stage];
    if (stage < 10) {
      targetsiny = 0;
    } else if (stage > 10) {
      targetsiny = random(-1,1);
      targetsinx = random(-1,1);
    }
    coordsSet = true;
  }
  
  
  
  if (stage == 6) {
    target();
    targety += sin(targetsiny)*3; // range of bob (but it affects speed so dont touch speed)
    targetsiny += 0.03; // speed of bob (lower speed = higher range)
  }
  if (stage == 7) {
    target();
    targety += sin(targetsiny)*6;
    targetsiny += 0.04;
  }
  if (stage == 8) {
    target();
    targety += sin(targetsiny)*10; 
    targetsiny += 0.05; 
  }
  if (stage == 9) {
    target();
    targety += sin(targetsiny)*12; 
    targetsiny += 0.05; 
  }
  
  if (stage == 10) {
    target();
    targety += sin(targetsiny)*random(4,6);
    targetsiny += 0.05;
    targetx += sin(targetsinx)*random(4,6);
    targetsinx += 0.05;
  }
  
  if (stage == 11) {
    target();
    targety += sin(targetsiny)*random(5,7);
    targetsiny += 0.05;
    targetx += sin(targetsinx)*random(5,7);
    targetsinx += -0.05;
  }
  if (stage == 12) {
    target();
    targety += sin(targetsiny)*random(6,7);
    targetsiny += 0.05;
    targetx += sin(targetsinx)*random(6,7);
    targetsinx += -0.05;
  }
  if (stage == 13) {
    target();
    targety += sin(targetsiny)*random(8,10);
    targetsiny += 0.05;
    targetx += sin(targetsinx)*random(8,10);
    targetsinx += 0.05;
  }
  
  if (stage == 14) {
    target();
    movetimer += 1;
    s -= 0.002;
    if (movetimer >= 90) {
      targetx = random(300,900);
      targety = random(200,550);
      movetimer = 0;
      s = 1;
    }
  }
  if (stage == 15) {
    target();
    movetimer += 1;
    s -= 0.002;
    if (movetimer >= 75) {
      targetx = random(300,900);
      targety = random(200,550);
      movetimer = 0;
      s = 1;
    }
  }
  if (stage == 16) {
    target();
    movetimer += 1;
    s -= 0.002;
    if (movetimer >= 60) {
      targetx = random(300,900);
      targety = random(200,550);
      movetimer = 0;
      s = 1;
    }
  }
  if (stage == 17) {
    target();
    movetimer += 1;
    s -= 0.002;
    if (movetimer >= 45) {
      targetx = random(300,900);
      targety = random(200,550);
      movetimer = 0;
      s = 1;
    }
  }
  
  if (stage == 17) {
    textSize(50);
    text("you win!!", 200,300);
    textSize(30);
    text("i ran out of time to make more levels", 300,400);
  }

  if (dist(daggerx+60,daggery, targetx,targety-30) <= 40) { // hit on target
    chuck = false;
    daggerx = hornetx;
    hitanimation = true;
    print("hit");
    bap.play();
    bap.rewind();
    s = 1.15;
  }
  
  if (daggerx >= 1200 && daggerx <= 1240) {
    misses += 1;
    
  }
  
  if (misses == 5) {
    mode = 3;
  }
  
  if (hitanimation == true) {
    whitetimer += 1;
    hitcolourR = 255;
    hitcolourG = 255;
    hitcolourB = 255;
    movetimer = 0;
  }
  if (whitetimer == 20) {
    hitanimation = false;
    whitetimer = 0;
    hitcolourR = 240;
    hitcolourG = 99;
    hitcolourB = 102;
    coordsSet = false;
    stage += 1;
    s = 1;
  }
    
} // end of game function



void hornet() {
  strokeWeight(3);
  stroke(0);
  fill(#D2D4D8);
  rect(hornetx,hornety, hornetwidth,hornetheight);
  
}
float s = 1;
void target() {
  pushMatrix();
  translate(targetx,targety);
  scale(s);
  stroke(0);
  strokeWeight(3);
  fill(hitcolourR, hitcolourG, hitcolourB);
  ellipse(0, 0, 50,65); // target target
  noFill();
  fill(255);
  ellipse(0-4, 0, 35,48);
  fill(hitcolourR, hitcolourG, hitcolourB);
  ellipse(0-6, 0, 20,30);
  
  fill(#D3D3D3, 200); // wings
  noStroke();
  triangle(14,-17, 40,-30, 25,-45);
  triangle(-20,-21, -16,-40, -25,-34);
  popMatrix();
}

void ground() {
  strokeWeight(3);
  fill(#9D8888);
  stroke(0);
  rect(-10,600,1020,200);
  
}

void dagger() {
  stroke(0);
  strokeWeight(1);
  fill(255);
  pushMatrix();
  translate(daggerx,daggery);
  rect(40,32.5,30,5);
  line(43,32.5,46,37.5);
  line(49,32.5,52,37.5);
  line(55,32.5,58,37.5);
  circle(35,35,9);
  triangle(60,30, 100,35, 60,40);
  noStroke();
  fill(255,255,255,100);
  ellipse(60,35,90,20);
  popMatrix();
}
