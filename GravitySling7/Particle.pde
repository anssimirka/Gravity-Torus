



class Particle {
  PVector pos, vel, acc;
  float m;

  Particle(PVector pos, PVector vel, float m) {

    this.pos=pos;
    this.vel=vel;
    this.acc=new PVector(0, 0,0);

    this.m=m;
  }

  void update() {

    PVector force= new PVector(0, 0);
    for (int v=0; v<masses.length; v++) {
      Forces(this.pos, masses[v], t);
      force.add(totalForce);
    }

    this.acc=force;
    this.vel.add(force.mult(dt));
    this.vel.setMag(min(this.vel.mag(),c));  //use with care. it may not make things better

    this.pos.add(this.vel); //there should be dt here too
  }





  void show() {
    push();
    stroke(200-this.acc.mag()*3500, 255, 255);
    drawArrow(this.pos, this.vel);

    strokeWeight(10);
    point(this.pos.x, this.pos.y, this.pos.z);

    pop();
  }
}

  void drawArrow(PVector base, PVector vector) {
    push();
    strokeWeight(height / 150);
     noFill();
    // stroke(20, 85, 30, 180);
    translate(base.x, base.y,base.z); //set relative 0,0 coor
    line(0, 0,0, vector.x*10, vector.y*10,vector.z*10); //draw line from relative 0,0 to mouse
    rotate(vector.heading());
    int arrowSize = height / 150;
    translate(vector.mag()*10 - arrowSize, 0); //length of vec minus arrowsize relative
    triangle(0, arrowSize / 1.5, 0, -arrowSize / 1.5, arrowSize, 0);
    pop();
  }
  
  
