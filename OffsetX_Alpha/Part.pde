class Part{

  PVector pos;
  PVector pos0;
  PVector vel;
  float maxR;
  float r;
  float alpha;
  void update(){
    
    //alpha ramp
    float relPos = (pos.x-pos0.x)/maxR; //relative position
    if(relPos <.25){
      alpha = map(relPos, 0, .25, 0, 255); 
    }
    else if(pos.x-pos0.x/maxR >.75){
      alpha = map(relPos, .75, 1., 255, 0);
    }
    else{
      alpha = 255;
    }
    
    pos.add(vel);
    
    //wrapping
    if( (pos.x-pos0.x) > maxR){
      pos.x-=maxR;
    }
   
  }
  
  void draw(){
    
    pushMatrix();
    translate(pos.x, pos.y);
    fill(255,alpha);
    ellipse(0,0,50,50);
    popMatrix();
  
  }

}
