// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
import processing.pdf.*;
HelperFunctions hf = new HelperFunctions();

LSystem lsysA, lsysB, lsysC, lsysD;
Turtle turtle1,turtle2,turtle3,turtle4;
float noiseSeed;

void setup() {
  size(1600, 1200);
  
  // get the random seed
  noiseSeed = random(0.1, 0.5);
  print(noiseSeed);
  random(noiseSeed);

  
  Rule[] rulesetX = new Rule[1];
  rulesetX[0] = new Rule('X', "X[-FFF][+FFF]FX");

  Rule[] rulesetY = new Rule[3];
  rulesetY[0] = new Rule('X', "X[-FFF][+FFF]FX");
  rulesetY[1] = new Rule('Y', "YFX[+Y][-Y]"); 
  rulesetY[2] = new Rule('Y', "YFX[+Y]");
  
  Rule[] rulesetZ = new Rule[1];
  rulesetZ[0] = new Rule('Z', "FF+[+F-F-F]-[-F+F+F]");
  
  lsysA = new LSystem("YYY", rulesetX, rulesetY); 
  lsysB = new LSystem("YYY", rulesetX, rulesetY); 
  lsysC = new LSystem("YYY", rulesetX, rulesetZ);
  lsysD = new LSystem("YYY", rulesetX, rulesetY);
  //lsys = new LSystem("XXX", ruleset);  // XXX
  turtle1 = new Turtle(lsysA.getSentence(), height/3, radians(45));
  turtle2 = new Turtle(lsysB.getSentence(), height/3, radians(45));
  turtle3 = new Turtle(lsysC.getSentence(), height/3, radians(25));
  turtle4 = new Turtle(lsysD.getSentence(), height/3, radians(45));
}

void draw() {
  background(255); 
  frameRate(5);
  fill(0);
  //text("Click mouse to generate", 10, height-10);

  pushMatrix();
  translate(width/5, height);
  rotate(-PI/2);
  turtle1.render(lsysA.getGeneration(), noiseSeed);
  growTree(turtle1, lsysA, 0.5);
  popMatrix();
  
  pushMatrix();
  translate(width*2/5, height);
  rotate(-PI/2);
  turtle2.render(lsysB.getGeneration(), noiseSeed);
  growTree(turtle3, lsysB, 0.7);
  popMatrix();
  
   pushMatrix();
  translate(width*3/5, height);
  rotate(-PI/2);
  turtle3.render(lsysC.getGeneration(), noiseSeed);
  growTree(turtle2, lsysC, 0.55);
  popMatrix();
  
   pushMatrix();
  translate(width*4/5, height);
  rotate(-PI/2);
  turtle4.render(lsysD.getGeneration(), noiseSeed);
  growTree(turtle4, lsysD, 0.6);
  popMatrix();
  
  //hf.save("img", "["+String.valueOf(noiseSeed)+"]");
  //exit
  //noLoop();
}

int counter = 0;

void growTree(Turtle turtle, LSystem lsys, float len) {
  if (counter < 25) {
    pushMatrix();
    lsys.generate();
    //println(lsys.getSentence());
    turtle.setToDo(lsysA.getSentence());
    turtle.changeLen(len);
    popMatrix();
    redraw();
    counter++;
  }
}
