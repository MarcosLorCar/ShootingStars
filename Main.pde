int numBalls;
float gravity = 0.0;
float drag = 0.98;
Ball[] balls;
boolean pulling = false;



void setup() {
  numBalls = (width+height)/19;
  size(displayWidth, displayHeight);
  smooth();
  fill(0);
  stroke(0, 0, 0, 0);
  balls = new Ball[numBalls];
  for (int i = 0; i<numBalls; i++) {
    float randomVelx = (random(0, 2)-1)*6;
    float randomVely = (random(0, 2)-1)*6;
    float[] pos = new float[]{random(width)-20, random(height)-20};
    float[] vel = new float[]{randomVelx, randomVely};
    balls[i] = new Ball(i, pos, vel, int(random(5)*4+20));
  }
}

void draw() {
  if (mousePressed) {
    pulling=true;
    fill(100, 125);
    ellipse(mouseX,mouseY, 200, 200);
  } else {
    pulling=false;
  }
  fill(255);
  background(0, 10);
  stroke(255, 0, 0);
  fill(0, 0, 0, 0);
  //rect(1,1,width-1,height-1);
  for (int i = 0; i<numBalls; i++) {
    balls[i].update();
  }
}

void mouseReleased() {
  for (int i = 0; i<numBalls; i++) {
    if ((abs(mouseX-balls[i].pos[0])<100)&&(abs(mouseY-balls[i].pos[1])<100)) {
      balls[i].vel[0] = (random(0, 2)-1)*30;
      balls[i].vel[1] = (random(0, 2)-1)*30;
    }
  }
}
