class Button {
  String textWord;
  String delimiter;
  boolean mouseInside = false;
  PVector position = new PVector();
  int buttonNum;
  int alphaNum = 100;

  Button(String _t, int _n, String _d) {
    delimiter = _d;
    textWord = _t;
    buttonNum = _n;
  }

  // ------------------------------- if mouseover president button, enlarge button
  void checkMouse() {
    if (mouseX >= position.x && mouseX <= position.x + textWidth(textWord) && mouseY >= position.y && mouseY <= position.y+buttonHeight) {
      mouseInside = true;
      currentEmotionNum = buttonNum;
      currentButton = buttons.get(buttonNum);
      alphaNum = 255;
    } 
    else {
      //      mouseInside = false;
      alphaNum = 100;
    }
  }

  // ------------------------------- show the buttons
  void showButton(float _x, float _y) {

    // ------------------------------- define opacity based on mouseover button
    if (mouseX >= position.x && mouseX <= position.x + textWidth(textWord) && mouseY >= position.y && mouseY <= position.y + buttonHeight) {
      mouseInside = true;
      alphaNum = 255;
    } 
    else {
      alphaNum = 100;
    }

    // ------------------------------- keep opacity full when currentButton selected
    if (currentButton.buttonNum == buttonNum) {
      alphaNum = 255;
    }

    // ------------------------------- color the buttons based on rules above
    fill(colors[buttonNum], alphaNum);
    position.x = _x;
    position.y = _y;
    // ------------------------------- write buttons   
    text(textWord, position.x, position.y);
    // ------------------------------- write delimiters
    fill(0);
    text(delimiter, position.x + textWidth(textWord), position.y);
  }
}

