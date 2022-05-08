

void setup() {
  size(600, 800);
  stroke(200, 100);
  noFill();
  //fill(200,1);
  blendMode(1);
  strokeWeight(.4);
  background(0);
}

void draw() {
  drawSequence(frameCount);
  println(frameCount);
  if (frameCount > 10000) {
    noLoop();
    exit();
  }
  if(frameCount%100==0){
    saveFrame("./out/out-######.png");
  }
}


int step(int n) {
  return n%2==0?n/2:3*n+1;
}

int[] sequence(int n) {
  int n_ = n;
  int c = 1;
  while (n_!=1) {
    n_ = step(n_);
    c++;
  }
  int[] seq = new int[c];
  n_ = n;
  c--;
  seq[c] = n_;
  while (n_!=1) {
    n_ = step(n_);
    c--;
    seq[c] = n_;
  }
  return seq;
}


void drawSequence(int o) {
  int[] seq = sequence(o);
  float x = width;
  float y = 0;
  float d = 2. * width / seq.length;
  beginShape();
  curveVertex(x, y);
  for (int n = 0; n < seq.length; n++) {
    x += (seq[n]%2==0 ? -d : d);
    y += seq[n]/height; // height / seq.length;
    curveVertex(x, y);
  }
  endShape();
}
