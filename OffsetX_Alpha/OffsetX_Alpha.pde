Part[] parts = new Part[100];
int loopLength = 200;

boolean doExport = false;
void setup() {

  size(960, 540);
  background(0);
  randomSeed(0);

  for (int i=0; i<parts.length; i++) {
    parts[i] = new Part();
    float x0 = random(0, width);
    float y =height/float(parts.length)*(i+1)-height/float(parts.length)/2.0;
    parts[i].maxR = random(100,200);
    float offset =random(0, parts[i].maxR);
    parts[i].pos = new PVector(x0+offset, y);
    parts[i].pos0 = new PVector(x0, y);
    
    float vx = parts[i].maxR/float(loopLength);
  
    parts[i].vel = new PVector(vx, 0.);
  }

  noStroke();
}


void draw() {

  background(0);

  for (int i=0; i<parts.length; i++) {

    parts[i].update();
    parts[i].draw();
  }


  float fr = frameCount%loopLength;
  float rx = map(fr, 0, loopLength, 0, width);
  fill(100, 0, 0);
  rect(0, 0, width, 10);
  fill(255, 0, 0);
  rect(0, 0, rx, 10);

  if (doExport) {
    if (frameCount<(loopLength)) {
      println("saving:"  +frameCount);
      save("frames/"+nf(frameCount, 4)+".png");
    } else {
      println("done exporting");

      doExport = false;
    }
  }
}
