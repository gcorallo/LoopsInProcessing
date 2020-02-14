

PShader colorSh;
int loopLength=100;
float time;
boolean doExport = false;

void setup() {
   size(960, 540,P2D);
  noStroke();

  colorSh = loadShader("colorsh.glsl");
  colorSh.set("resolution", float(width), float(height));
}

void draw() {
  float step=2*PI/float(loopLength);
  time += step;

  colorSh.set("time", time);

  shader(colorSh);

  rect(0, 0, width, height); 

  //progress bar
  resetShader();
  float fr = frameCount%loopLength;
  float rx = map(fr, 0, loopLength, 0, width);
  fill(100, 0, 0);
  rect(0, 0, width, 10);
  fill(255, 0, 0);
  rect(0, 0, rx, 10);

  if (frameCount%30==0) {
    colorSh = loadShader("colorsh.glsl");
    colorSh.set("resolution", float(width), float(height));
  }  

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
