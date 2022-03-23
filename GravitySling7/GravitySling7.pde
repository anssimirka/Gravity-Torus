
import peasy.*;

PeasyCam cam;

boolean recording =false;
Mass p, P, Q;
float m=1;
float M=5000;
float G=1;
float c=100;

int cnt=0;
float dt=0.01; 
float t=0;

HScrollbar hs1, hs2;

float f=0.08; //freq
int R=100; //radius
int n=8;  //for n>3 there almost no waves!
int k=5;
Mass[] masses;
Particle[] particles;


void settings() {
  size(1200, 800, P3D);
}



void setup() {  
  colorMode(HSB);
  cam = new PeasyCam(this, 1200);
  frameRate(60);

  initiateMasses(n, 4);

  initiateParticles(k);

  hs1 = new HScrollbar(0, height-40, width, 16, 16);
  hs2 = new HScrollbar(0, height-20, width, 16, 16);
}


void draw() {
  if (cnt==1200)exit();

  background(0);

  t=cnt*dt;


  zooms();
  //  texts();


  // showFieldComponents( t);

  showMasses();
  showParticles();

  cnt++;

  /*
  hs1.update();
   hs1.display();
   hs2.update();
   hs2.display();
   */

  if (recording) {
    saveFrame("output/AccelerationDragEffect_####.png");
  }
}


void initiateMasses(int n, int N) {
  masses = new Mass[n*2*N];

  float angle =0; 
  float w=0;

  for (int j=-N; j<N; j++) {
    w+=PI/N;
    for (int i=0; i<n; i++) {
      angle+=PI*2/n;
      /*
      masses[N*n + n*j+i]= new Mass(new PVector(R*cos(angle), R*sin(angle)), new PVector(500*j, 700), a, M);
       masses[N*2*n+N*n + n*j+i]= new Mass(new PVector(R*cos(angle), R*sin(angle)), new PVector(500*j, -700), -a, M);
       */
      masses[N*n + n*j+i]= new Mass( new PVector(0, R*5, 0), w, R, angle, f, M);
    }
  }
}

void initiateParticles(int l) {
  particles = new Particle[4*l*l];

  float angle =0; 
  float w=0;
  float r= R/5;
  
  for (int j=-l; j<l; j++) {
    w+=width/l/3;
    for (int i=-l; i<l; i++) {
      angle+=PI/l;
      particles[l+2*l*l +i+j*2*l]= new Particle(new PVector(-w, r*cos(angle), r*sin(angle) ), new PVector(0, 0), m);
    }
  }
}
/*
void initiateParticles(int l) {
 particles = new Particle[2*l*l*l];
 float sep =width/l/6;
 for (int k=-l/2; k<l/2; k++) {
 for (int j=-l/2; j<l/2; j++) {
 for (int i=-l; i<l; i++) {
 particles[l+l*l+l*l*l +i+j*2*l+ 2*k*l*l]= new Particle(new PVector(sep*2*i-500, sep*j, sep*k), new PVector(0, 0), m);
 }
 }
 }
 }
 */

void showMasses() {

  for (int i=0; i<masses.length; i++) {
    masses[i].show(t);
  }
}

void showParticles() {

  for (int i=0; i<particles.length; i++) {    
    particles[i].update();
    particles[i].show();
  }
}


void zooms() {
  translate(100, -100, -300);  //use in the ROW MODE
  rotateX(PI/3);
  rotateZ(-PI/3);

  float L= 1/(1+exp(-(t-4)*3));
  // rotateX(L*PI/3);
  // rotateZ(-L*PI/3);
}
