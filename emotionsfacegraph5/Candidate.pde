class Candidate {
  String party;
  int yearRunning;
  int angry;
  int afraid;
  int hopeful;
  int proud;
  int[] emotionValues = new int[4];
  int highest;

  PImage photo;
  PVector currentPos = new PVector();
  boolean isInside = false;
  int imageSize = circleSize;
  int moreInfo;
  int candidateNum;
  float imgScale;

  String name;

  Candidate(int _y, int _c) {
    yearRunning = _y;
    candidateNum = _c;
  }

  // -------------------------------add image names to string
  void addImage() {
    String picString = yearRunning + "_" + party + ".png";
    photo = loadImage(picString);
    imgScale = float(photo.height)/float(photo.width);
  }

  // -------------------------------load values into sketch based on chosen emotion
  void addInfo(String _info, String _value) {
    String[] tempString = split(_info, " - ");
    party = tempString[0];
    String emotion = tempString[1];
    if (emotion.equals("Angry")) {
      angry = int(_value);
      emotionValues[0] = angry;
    }
    else if (emotion.equals("Afraid")) {
      afraid = int(_value);
      emotionValues[1] = afraid;
    }
    else if (emotion.equals("Hopeful")) {
      hopeful = int(_value);
      emotionValues[2] = hopeful;
    } 
    else if (emotion.equals("Proud")) {
      proud = int(_value);
      emotionValues[3] = proud;
    }

    // -------------------------------load names into sketch        
    if (tempString.length > 2) {
      name = tempString[2];
    }
  }


  // ------------------------------- draw heads/circles
  void drawImage(float _x, float _y) {
    currentPos.x = _x;
    currentPos.y = _y;
    fill(colors[currentEmotionNum]);
    ellipse(currentPos.x, currentPos.y, (imageSize * imgScale) + 10, (imageSize * imgScale) + 10);
    image(photo, currentPos.x, currentPos.y, imageSize, imageSize * imgScale);

    // ------------------------------------------------ more information on mouseOver
    textFont(font, 30);
    textAlign(LEFT, TOP);
    if (isInside) {
      // 100% of folks polled said "candidate" made them feel "emotion"
      text(moreInfo + "% of folks polled felt " + currentButton.textWord + " about " + name + " in " + yearRunning, 35, 670);
    }
  }


  // ------------------------------- if mouseover, enlarge heads/circles
  void checkMouse() {
    PVector mousePos = new PVector(mouseX, mouseY);
    float d = PVector.dist(currentPos, mousePos);
    if (d < circleSize) {
      isInside = true;
      imageSize = 200;

      // ------------------------------- and display the % 
      moreInfo = emotionValues[currentEmotionNum];
      currentCandidate = candidates.get(candidateNum);
    } 
    else {
      isInside = false;
      imageSize = circleSize;
      currentCandidate = null;
    }
  }
}

