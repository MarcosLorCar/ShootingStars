class Ball {
  float[] vel, pos;
  float mass;
  int rad, r, g, b;
  int id;
  Ball(int id, float[] pos, float[] vel, int rad) {
    this.pos = pos;
    this.pos[0] +=10;
    this.pos[1] +=10;
    this.id = id;
    this.vel = vel;
    this.rad = rad;
    mass = 0.1*rad;
    r = int(random(100)+155);
    g = int(random(100)+155);
    b = int(random(100)+155);
  }

  void update() {
    
    

    
    //finger pull

    if (pulling) {
      vel[0] += (mouseX-pos[0])*0.001;
      vel[1] += (mouseY-pos[1])*0.001;
    }
    if (((abs(vel[1])+abs(vel[0]))>7)||pulling) {
      vel[0] *= drag;
      vel[1] *= drag;
    }
    
    pos[0]+=vel[0];
    pos[1]+=vel[1];


    //tp

    if (((pos[1]>height)||(pos[1])<0)) {
      if (((pos[1])>height)&&(vel[1]>0)) {
        pos[1] = 0;
      } else if (((pos[1])<0)&&(vel[1]<0)) {
        pos[1] = height;
      }
    } else {
      vel[1] += gravity*mass;
    }
    if (((pos[0]>width))||((pos[0]<0))) {
      if ((pos[0]>width)&&(vel[0]>0)) {
        pos[0] = 0;
        //vel[0] -= (pos[0]+rad - width)*0.1;
      } else if ((pos[0])<0) {
        pos[0] = width;
        //vel[0] -= ((pos[0]-rad))*0.1;
      }
    }

    fill(r, g, b);
    stroke(0, 0, 0, 0);
    ellipse(pos[0], pos[1], rad*2, rad*2);
    //rect(pos[0]-rad,pos[1]-rad,rad*2,rad*2);
  }
}
