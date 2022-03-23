
PVector force1, force2, force3;
PVector  totalForce;
float dist, tr;



void Forces(PVector loc, Mass p, float time) {

  PVector retarded = retard(loc, p, time, 10);

  force1= new PVector(retarded.x-loc.x, retarded.y-loc.y, retarded.z-loc.z).mult(G*M/(dist*dist*dist)/100);
  force2= new PVector(p.getAcc(tr).x, p.getAcc(tr).y, p.getAcc(tr).z).mult(4*G*M/(c*c*dist));  
  float adotR = p.getAcc(tr).x*(retarded.x-loc.x) +p.getAcc(tr).y*(retarded.y-loc.y)+p.getAcc(tr).z*(retarded.z-loc.z);
  force3= new PVector(p.getVel(tr).x, p.getVel(tr).y, p.getVel(tr).z).mult(4*G*M/(c*c*c*dist*dist)).mult(adotR);

  totalForce=force3.add(force2);
 // totalForce.add(force1);

}


PVector retard(PVector loc, Mass p, float time, int n) {
  
  tr=time;
   PVector displace= new PVector(loc.x-p.getPos(tr).x, loc.y-p.getPos(tr).y,loc.z-p.getPos(tr).z);
    dist= displace.mag();
  
 /*
  float upper=time;
  float lower=0;
  upper=time;
  lower=0;
  tr=time/2;

  int i=0;
  while (i<n) {

    PVector displace= new PVector(loc.x-p.getPos(tr).x, loc.y-p.getPos(tr).y);
    dist= displace.mag();

    if (dist/c>(time-tr)) {
      upper=tr;
      tr=(upper+lower)/2;
    } else {
      lower= tr;
      tr=(upper+lower)/2;
    }
    if (tr<0.01) {
      tr=0;
      break;
    }
    //
    i++;
  }
*/

  return new PVector(p.getPos(tr).x, p.getPos(tr).y, p.getPos(tr).z);
}
