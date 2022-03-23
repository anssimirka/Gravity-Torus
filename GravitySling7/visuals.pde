int N=20; 
int scl=45;



void showFieldComponents( float time) {
  for (int i=-N; i<N; i++) {
    for (int j=-N; j<N; j++) {

      PVector q= new PVector(i*scl, j*scl, -10);

      PVector force= new PVector(0, 0,0);
      for (int v=0; v<masses.length; v++) {
        Forces(q, masses[v], time);
        force.add(totalForce);
      }
      showForce(q, force);
    }
  }
}



void showForce(PVector p, PVector f) {

  float s= f.mag()*50;
  stroke(200-s*1, 255, 255, 100);
  strokeWeight(constrain(s*150, 1, 4));
  f.setMag(min(0.9, s));
  //point( p.x, p.y, - hs2.getPos()*s);
  drawArrow(p, f.mult(3));
}


/*
void showTotalForce(PVector p) {
 pushMatrix();
 
 PVector totalF= new PVector(force2.x+force3.x, force2.y+ force3.y);
 totalF.setMag(min(1, totalF.mag()));
 
 strokeWeight(2);
 //line(p.x, p.y, p.x+100*force.x, p.y+ 100*force.y);
 stroke(totalF.mag()*200, 255, 255, 150);
 strokeWeight(min(5, force2.mag()*10));
 //line(p.x, p.y, p.x+hs1.getPos()*c*totalF.x*10, p.y+ hs1.getPos()*c*totalF.y*10);
 point( p.x+hs1.getPos()*c*totalF.x*10, p.y+ hs1.getPos()*c*totalF.y*10);
 
 
 
 popMatrix();
 }
 */
