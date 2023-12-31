import java.awt.geom.Point2D;

int counter;
int counter2;
float xg = 80; //makes tree narrower
float yg = 52; // makes tree shorter
int trunkSegments = int(random(100))+5; //between 5 and 104
int nodeLimit = 20000;
Point2D.Float[]pts = new Point2D.Float[nodeLimit];
int branchLimit = 2000;
float trunkLength = int(random(50))+130;
float[]lean2 = new float[trunkSegments + 1];
float radius = 26;

void setup(){
  size(900,600);
  background(255);
  stroke(30,10,5); //colour of trunk
  
  trunk(); }
  
void trunk () {
  for (int i = 0; i<trunkSegments; i++) {
    float lean = myRand(22);
    strokeWeight(radius);
    line(width/2+lean2[i], height - (trunkLength/trunkSegments)*i, width/2+lean, height-(trunkLength/trunkSegments)*(i+1));
    lean2[i+1] = lean;
  }
   
   pts[0] = new Point2D.Float(width/2+lean2[trunkSegments], height-trunkLength);
   
   branch(pts);
}

void branch (Point2D.Float[]pts) {
  int stemCount = 2; //makes more stems, less is more! 1 is just a single squiggly line
  
  if(counter2<branchLimit){
    strokeWeight(radius+5);
    
    if(counter2<200){
      yg -=random(.354);
      xg -=random(.625);
      
      if(radius>2){
        radius*=.931;
      }
      
    } else if (counter2>=200){
      stemCount = 2+(int)(Math.random()*15);
      
      stroke(random(10), 50+random(80) 
      //higher is lighter green
      , random(1), 40); //leaf colour
      
      //stroke(v1,v2,v3,alpha)
      
      yg -=myRand(.65);
      xg += random(1.5);
      
      radius*=(.91);
      
    }
    
    for ( int j=0; j<stemCount; j++){
      float xx = myRand(30);
      float yy = myRand(40);
      
      orgLine(pts[counter2].x, pts[counter2].y, pts[counter2].x+xg+xx, pts[counter2].y-yg+yy);
      
      pts[counter+1] = new Point2D.Float(pts[counter2].x+xg+xx, pts[counter2].y-yg+yy);
      
      xg*=-1;
      
      counter++;
    }
    
    counter2++;
    
    branch(pts);
    
  }
  
}

void orgLine ( float x1, float y1, float x2, float y2){
  int sections = 8;
  
  float xd = x2-x1;
  float yd = y2-y1;
  
  float twist;
  float[]twist2 = new float[sections+1];
  
  for(int i = 0; i<sections; i++){
    twist = myRand(5);
    line(x1+xd/sections*i+twist2[i], y1+yd/sections*i, x1+xd/sections*(i+1)+twist, y1+yd/sections*(i+1));
    twist2[i+1] = twist;
  }
  
}

float myRand(float val){
  return random(val)+random(-val);
}
      
    
