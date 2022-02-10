// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

LSystem lsysA, lsysB, lsysC, lsysD;
Turtle turtle1,turtle2,turtle3,turtle4;

void setup() {
  size(1600, 1200);
  
  Rule[] rulesetX = new Rule[1];
  rulesetX[0] = new Rule('X', "X[-FFF][+FFF]FX");

  Rule[] rulesetY = new Rule[3];
  rulesetY[0] = new Rule('X', "X[-FFF][+FFF]FX");
  rulesetY[1] = new Rule('Y', "YFX[+Y][-Y]"); 
  rulesetY[2] = new Rule('Y', "YFX[+Y]");
  
  lsysA = new LSystem("YYY", rulesetX, rulesetY); 
  lsysB = new LSystem("YYY", rulesetX, rulesetY); 
  lsysC = new LSystem("YYY", rulesetX, rulesetY);
  lsysD = new LSystem("YYY", rulesetX, rulesetY);
  //lsys = new LSystem("XXX", ruleset);  // XXX
  turtle1 = new Turtle(lsysA.getSentence(), height/3, radians(45));
  turtle2 = new Turtle(lsysB.getSentence(), height/3, radians(45));
  turtle3 = new Turtle(lsysC.getSentence(), height/3, radians(45));
  turtle4 = new Turtle(lsysD.getSentence(), height/3, radians(45));
}

void draw() {
  background(255);  
  fill(0);
  //text("Click mouse to generate", 10, height-10);

  
  pushMatrix();
  translate(width/5, height);
  rotate(-PI/2);
  turtle1.render(lsysA.getGeneration());
  growTree(turtle1, lsysA, 0.5);
  popMatrix();
  
  pushMatrix();
  translate(width*2/5, height);
  rotate(-PI/2);
  turtle2.render(lsysB.getGeneration());
  growTree(turtle3, lsysB, 0.7);
  popMatrix();
  
   pushMatrix();
  translate(width*3/5, height);
  rotate(-PI/2);
  turtle3.render(lsysC.getGeneration());
  growTree(turtle2, lsysC, 0.7);
  popMatrix();
  
   pushMatrix();
  translate(width*4/5, height);
  rotate(-PI/2);
  turtle4.render(lsysD.getGeneration());
  growTree(turtle4, lsysD, 0.7);
  popMatrix();
  
  //hf.save("img", "["+String.valueOf(randomC.getBaseColor())+"]");
  //exit();
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
