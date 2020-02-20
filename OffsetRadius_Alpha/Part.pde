class Part{

  
  float vel;
  float maxR;
  float r;
  float r0;
  float alpha;
  float ang;
  void update(){
    
    //alpha ramp
    float relPos = (r-r0)/maxR; //relative position
    if(relPos <.25){
      alpha = map(relPos, 0, .25, 0, 255); 
    }
    else if(relPos>.75){
      alpha = map(relPos, .75, 1., 255, 0);
    }
    else{
      alpha = 255;
    }
    
    r+=vel;
    
    //wrapping
    if( (r-r0) > maxR){
     r-=maxR;
    }
   
  }
  
  void draw(){
    
    
    float x = cos(ang)*r + width/2;
    float y = sin(ang)*r +height/2;
    fill(255, alpha);
    ellipse(x,y,50,50);
    
  
  }

}
