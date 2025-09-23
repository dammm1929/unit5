import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minimtools;
AudioPlayer bap;
AudioPlayer whoosh;
AudioPlayer music;

// kings pass project
boolean jump; boolean chuck; boolean hit;
int mode;
float[] targx;
float[] targy;

PImage[] gif;
int frames; // 74 (0-73)

void setup() {
  size(1000,700);
  mode = 1;
  targx = new float[30];
  targy = new float[30];
  
  minimtools = new Minim(this);
  
  bap = minimtools.loadFile("hit-sound-effect.mp3.mp3");
  whoosh = minimtools.loadFile("throw-sound-effect.mp3.mp3");
  music = minimtools.loadFile("song.mp3.mp3");
  music.play();
  
  frames = 74;
  gif = new PImage[frames];
  int o = 0;
  while(o < frames) {
    gif[o] = loadImage("frame_" + o + "_delay-0.14s.gif");
    o+=1;
  }
  
  for (int i = 0; i < 5; i++) { // assign coordinates for first 5 targets (first one is guaranteed)
    targx[i] = random(300,900);
    targy[i] = random(200,550);
  }
  
  for (int i = 5; i < 8; i++) { // assign coordinates for stages 5-7 (smaller area)
    targx[i] = random(400,800);
    targy[i] = random(259,260);
  }
  
  for (int i = 8; i < 10; i++) { // assign coordinates for stages 7-9 (even smaller area)
    targx[i] = random(400,800);
    targy[i] = random(119,130);
  }
  
  for (int i = 10; i <= 13; i++) { // assign coordinates for stages 10-13
    targx[i] = random(400,800);
    targy[i] = random(290,300);
  }

  for (int i = 14; i <= 18; i++) { // assign coordinates for stages 14-18
    targx[i] = random(300,900);
    targy[i] = random(200,550);
  }
}

void draw() {
  if (mode == 1) {
    intro();
  } else if (mode == 2) {
    game();
  } else if (mode == 3) {
    gameover();
  } else {
    println("error mode = " + mode);
  }
}

void keyPressed() {
  if (key == 'w') {
    jump = true;
    print(misses);
  }
  if (key == ' ') {
    chuck = true;
    daggery = hornety;
    daggerx = hornetx;
    whoosh.play();
    whoosh.rewind();
  }
}

void keyReleased() {
  if (key == 'w') jump = false;
}


void mousePressed() {
  if (mouseX > 400 && mouseX < 600 && mouseY > 400 && mouseY < 500 && mode == 1) {
    mode = 2;
  }
  
  if (mouseX > 600 && mouseX < 800 && mouseY > 500 && mouseY < 600 && mode == 3) {
    mode = 2;
    stage = 1;
    misses = 0;
  }
}


void tactile(int x, int y) {
  if (mouseX > 400 && mouseX < 600 && mouseY > 400 && mouseY < 500) {
    fill(#C6C6C6);
  }
}

void tactileLose(int x, int y) {
  if (mouseX > 600 && mouseX < 800 && mouseY > 500 && mouseY < 600) {
    fill(#C6C6C6);
  }
  
}
