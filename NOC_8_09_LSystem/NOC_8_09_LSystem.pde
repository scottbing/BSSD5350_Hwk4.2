// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

LSystem lsysA, lsysB;
Turtle turtle1,turtle2;

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
  //lsys = new LSystem("XXX", ruleset);  // XXX
  turtle1 = new Turtle(lsysA.getSentence(), height/3, radians(45));
  turtle2 = new Turtle(lsysB.getSentence(), height/3, radians(45));
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
  growTree(turtle2, lsysB, 0.7);
  popMatrix();
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
