



class Mass {
  float  cx, cy, cz, tilt, R, a;
  float m,f;

  Mass( PVector center, float tilt,  int radius,float angle, float f, float m) {

    this.cx=center.x;
    this.cy=center.y;
    this.cz=center.z;
    this.tilt=tilt;
    this.R=radius;
    this.a= angle;

    this.m=m;
    this.f=f;
  }
  

  

  PVector getPos(float t) {
    if (t<=0) {
      return new PVector(this.cx + R*cos(a) ,this.cy+R*sin(a)*cos(tilt), this.cz + R*sin(tilt));
    } else {
      return new PVector(this.cx+this.R*cos(this.a+this.f*t*t),(this.cy+ this.R*sin(this.a+this.f*t*t))*cos(this.tilt), (this.cz+ this.cy+R*sin(this.a+this.f*t*t))*sin(this.tilt));
    }  
  }

  PVector getVel(float t) {
    if (t<=0) {
      return new PVector(0, 0);
    } else {
      return new PVector(-this.R*sin(this.a+t*t*this.f)*this.f*2*t , this.R*cos(this.a+t*t*this.f)*this.f*2*t*cos(tilt) , R*cos(this.a+this.f*t*t)*this.f*2*t*sin(this.tilt) );
    }
  }

  PVector getAcc(float t) {
    if (t<=0) {
      return new PVector(0, 0);
    } else {
      return new PVector(this.R*(-cos(this.a+t*t*this.f)*this.f*this.f*4*t*t -sin(this.a+t*t*this.f)*this.f*2),this.R*(-sin(this.a+t*t*this.f)*this.f*4*t*t*cos(tilt)+cos(this.a+t*t*this.f)*this.f*2*cos(tilt)),  R*(-sin(this.a+this.f*t*t)*this.f*4*t*t*sin(this.tilt)+ cos(this.a+this.f*t*t)*this.f*2*sin(this.tilt)));
    }
  }


  void show(float t) {
    pushMatrix();
    strokeWeight(min(m, 20));
    stroke(255);
    fill(255);
    int fast=1;
    point(getPos(t*fast).x, getPos(t*fast).y, getPos(t*fast).z);

    popMatrix();
  }
}

int sign(float f) {
  if (f > 0) return 1;
  if (f < 0) return -1;
  return 0;
}
