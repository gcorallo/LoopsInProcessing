Part[] parts = new Part[6];
int loopLength = 100;
int margin = 50;

boolean doExport = false;
void setup() {

  size(960, 540);
  background(0);
  randomSeed(0);

  for (int i=0; i<parts.length; i++) {
    parts[i] = new Part();
    parts[i].phaseX = random(0, 2*PI);
    parts[i].phaseY = random(0, 2*PI);
    parts[i].ampX = random(width/5, width/3);
    parts[i].ampY = random(height/5, height/3);
    if (random(1)<.5) {
      parts[i].signX = 1;
    } else {
      parts[i].signX = -1;
    }
    if (random(1)<.5) {
      parts[i].signY = 1;
    } else {
      parts[i].signY = -1;
    }
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
