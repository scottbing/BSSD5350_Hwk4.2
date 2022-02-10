// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// An LSystem has a starting sentence
// An a ruleset
// Each generation recursively replaces characteres in the sentence
// Based on the rulset

class LSystem {

  String sentence;     // The sentence (a String)
  Rule[] rulesetX;      // The ruleset (an array of Rule objects)
  Rule[] rulesetY;      // The ruleset (an array of Rule objects)
  Rule[] rulesetZ;      // The ruleset (an array of Rule objects)
  int generation;      // Keeping track of the generation #

  // Construct an LSystem with a startin sentence and a ruleset
  LSystem(String axiom, Rule[] rX, Rule[] rY) {
    sentence = axiom;
    rulesetX = rX;
    rulesetY = rY;
    generation = 0;
  }

  // Generate the next generation
  void generate() {
    // An empty StringBuffer that we will fill
    StringBuffer nextgen = new StringBuffer();
    // For every character in the sentence
    for (int i = 0; i < sentence.length(); i++) {
      // What is the character
      char curr = sentence.charAt(i);
      // We will replace it with itself unless it matches one of our rules
      String replace = "" + curr;
      // Check every rule
      Rule[] rules = new Rule[2]; // 2 random rules
      rules[0] = rulesetX[floor(random(0,rulesetX.length))]; // rand rule X
      rules[1] = rulesetY[floor(random(0,rulesetY.length))]; // rand rule Y
      for (int j = 0; j < rules.length; j++) {
        char a = rules[j].getA();
        // if we match the Rule, get the replacement String out of the Rule
        if (a == curr) {
          replace = rules[j].getB();
          break; 
        }
      }
      // Append replacement String
      nextgen.append(replace);
    }
    // Replace sentence
    sentence = nextgen.toString();
    // Increment generation
    generation++;
  }

  String getSentence() {
    return sentence; 
  }

  int getGeneration() {
    return generation; 
  }


}
