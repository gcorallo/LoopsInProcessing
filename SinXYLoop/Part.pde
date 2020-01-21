class Part {


  PVector pos = new PVector();

  float ampX, ampY;
  float phaseX, phaseY;
  int signX, signY;

  void update() {

    float step = 2*PI/float(loopLength);
    float x = sin(frameCount*step*signX+phaseX)*ampX+width/2;
    float y = sin(frameCount*step*signY+phaseY)*ampY+height/2;

    pos.set(new PVector(x, y));
  }

  void draw() {

    pushMatrix();
    translate(pos.x, pos.y);
    fill(255);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
}
