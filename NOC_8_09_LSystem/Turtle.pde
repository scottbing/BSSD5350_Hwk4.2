// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Turtle {

  String todo;
  float len;
  float theta;

  Turtle(String s, float l, float t) {
    todo = s;
    len = l; 
    theta = t;
  } 

  void render(int generation, float noiseSeed) {
    stroke(0, 175);
    for (int i = 0; i < todo.length(); i++) {
      theta += random(-.5, .5 + noiseSeed);
      char c = todo.charAt(i);
      float rlen = random(0.1, 0.7);
      //if (c == 'F' || c == 'G') {
      if (c == 'F') {
        line(0, 0, len, 0);
        translate(len, 0);
      } else if(c == 'G') { // movew without drawing
          translate(len, 0);
      } else if(c == '|') { // moves without drawing
          line(0, 0, len*generation, 0);
          translate(len, len*generation, 0);
      } else if (c == '+') {
        rotate(theta);
      } else if (c == '-') {
        rotate(-theta);
      } else if (c == '[') {
        pushMatrix();
      } else if (c == ']') {
        popMatrix();
      } else if (c == 'Y') {
        fill(128,0,0);
        float sz = 9 * random(0.2, 1.7);
        rect(0,0,sz,sz);
      } else if (c == 'X') {
        fill(0,128,0);
        circle(0,0,10*random(0.2,1.7));
      }
    }
  }

  void setLen(float l) {
    len = l;
  } 

  void changeLen(float percent) {
    len *= percent;
  }

  void setToDo(String s) {
    todo = s;
  }
}
