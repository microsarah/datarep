int[] years = new int[8];
ArrayList<Candidate> candidates = new ArrayList();
int leftIndent = -100;
int topIndent = -80;
int circleSize = 45;
int graphWidth = 1400;
int graphHeight = 720;
color[] colors = new color[4];
int currentEmotionNum = 1;
int buttonWidth = 100;
int buttonHeight = 30;
ArrayList <Button> buttons = new ArrayList();
PFont font;
Button currentButton;
Candidate currentCandidate;


void setup() {
  size(1280, 720);
  background(0);
  smooth();
  loadData();

  // ------------------------------- add an image for each candidate
  for (int i=0;i < candidates.size();i++) {
    Candidate c = candidates.get(i);
    c.addImage();
  }

  font = loadFont("Helvetica-48.vlw");
  textFont(font, 20);
  imageMode(CENTER);

  // ------------------------------- emotion colors
  colors[0]=color(255, 0, 0);  // angry
  colors[1]=color(0, 162, 21);  // afraid
  colors[2]=color(255, 193, 40);  // hopeful
  colors[3]=color(122, 74, 240);  // proud

  // ------------------------------- define text for emotion buttons
  Button a = new Button("angry", 0, ",");
  Button b = new Button("afraid", 1, ",");
  Button c = new Button("hopeful", 2, " &");
  Button d = new Button("proud", 3, ".");


  // ------------------------------- add emotion buttons & define currentButton
  buttons.add(a);
  buttons.add(b);
  buttons.add(c);
  buttons.add(d);
  currentButton = buttons.get(1);
}


void draw() {
  background(230);


  // ------------------------------- title
  fill(0);
  textAlign(LEFT, TOP);
  textFont(font, 47);
  text("Hey, Mr. Presidential Candidate.", 35, 20);
  text("You made us feel", 38, 75);

  // ------------------------------- draw emotion buttons
  textFont(font, 47);
  for (int i = 0; i < (buttons.size()-1); i++) {
    Button n = buttons.get(i);

    // ------------------------------- space btw 1st 3 buttons
    n.showButton(415 + (i * 145), 75);
    fill(0);
  }

  for (int i = buttons.size()-1; i < buttons.size(); i++) {
    Button n = buttons.get(i);
    n.showButton(480 + (i * 145), 75);
  }


  // ------------------------------- retrieve each candidate and define where they'll be drawn  
  noStroke();
  strokeWeight(5);
  for (int i = 0; i < candidates.size(); i++) {
    Candidate d = candidates.get(i);
    d.checkMouse();
    float mapX = map(d.yearRunning, 1976, 2012, leftIndent, leftIndent + graphWidth);
    float mapY = map(d.emotionValues[currentEmotionNum], 0, 100, topIndent + graphHeight, topIndent);

    // -------------------------------  
    if (d.party.equals("Democrat")) {
      d.drawImage(mapX, mapY);
    } 
    else {
      d.drawImage(mapX + (circleSize + 30), mapY);
    }
  }
}


// -------------------------------load data from CSV
void mouseClicked() {
  textFont(font, 30);
  for (int i = 0; i < buttons.size(); i++) {
    Button n = buttons.get(i);
    n.checkMouse();
  }
}


// -------------------------------load data from CSV
void loadData() {
  String[] rows = loadStrings("candidates.csv");
  String[] oddRows;
  String[] evenRows;
  String[] demNames;
  String[] repNames;   

  years = int(rows[0].split(";"));

  for (int j = 1; j < 9; j++) {
    Candidate d = new Candidate(years[j], candidates.size());
    candidates.add(d);
    Candidate r = new Candidate(years[j], candidates.size());
    candidates.add(r);

    // ------------------------------- add democrat info
    for (int i = 1; i < 17; i += 4) {
      oddRows = rows[i].split(";");
      evenRows = rows[i + 1].split(";");
      d.addInfo(oddRows[j], evenRows[j]);
    }
    // ------------------------------- add republican info
    for (int i = 3; i < 17; i += 4) {
      oddRows = rows[i].split(";");
      evenRows = rows[i + 1].split(";");
      r.addInfo(oddRows[j], evenRows[j]);
    }
  }
}

