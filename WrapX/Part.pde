class Part{

  PVector pos;
  PVector vel;
  
  void update(){
    pos.add(vel);
    
    if(pos.x>width+margin){
      pos.x-=(width+2*margin);
    }
    else if(pos.x<-margin){
      pos.x+=(width+2*margin);
    }
  }
  
  void draw(){
    
    pushMatrix();
    translate(pos.x, pos.y);
    fill(255);
    ellipse(0,0,50,50);
    popMatrix();
  
  }

}
