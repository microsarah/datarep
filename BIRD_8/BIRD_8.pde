ArrayList<allBirds> birds = new ArrayList();

void setup() {
  size(1280, 720);
  background(0);
  smooth(8);
  
//  stroke(0,255,0);
//  line(width/2, 0, width/2, height);

  title();
  loadData();
  birdBars2011();
  birdData2011();
  birdBars2010();
  birdData2010();
  
  save("BIRDS.png");
}



// ---------------------------------- title
void title() {
  PFont bold;
  fill(255);
  bold = loadFont("HelveticaNeue-Bold-48.vlw");
  textFont(bold, 28);
  text("Birds in Your British Backyard", 450, 40);
  text("2010", width/4 - 10, (height/2) - 20);
  text("2011", (width/4)*3 - 40, (height/2) - 20);  
}


// ---------------------------------- birds graph 2010
void birdBars2010() {
  pushMatrix();
  translate(-width/2.15, -(height/12) + 15);

  for (int i = 0; i < birds.size(); i++) {
    allBirds b = birds.get(i);

    float barWidth = 15;
    float c = 255 - map(Math.abs(b.perGardens2010), 0, 95.2, 0, 255); 
    float totalBirds = 74;
    float barLength = map(b.perGardens2010, 0, 95.2, 0, 100);

    rotate(TWO_PI / totalBirds);
    noStroke();
    fill(255, c, 235);
    rect(0, 200, barWidth, barLength);
  } 
  popMatrix();
}


// ---------------------------------- numbers & names 2010
void birdData2010() {

  translate(-width/2.15, -(height/12) + 15);
  for (int i = 0; i < birds.size(); i++) {
    allBirds b = birds.get(i);

    float barLength = map(b.perGardens2010, 0, 95.2, 0, 100);

    rotate(TWO_PI / 74);  
    PFont plain; 
    plain = loadFont("Helvetica-48.vlw");
    textFont(plain, 9);
    float c = 255 - map(Math.abs(b.perGardens2010), 0, 95.2, 0, 255); 
    fill(255, c, 235);
    pushMatrix();
    rotate(PI/2);
    text(int(b.perGardens2010), 185, i-i);  
     text(b.species, barLength+205, i-i);  

    popMatrix();
  }
}


// ---------------------------------- birds per garden 2011
void birdBars2011() {
  pushMatrix();
  
  translate(width-338, (height/2)-20);
  for (int i = 0; i < birds.size(); i++) {
    allBirds b = birds.get(i);

    float barWidth = 15;
    float c = 255 - map(Math.abs(b.perGardens), 0, 96, 0, 255); 
    float totalBirds = 74;
    float barLength = map(b.perGardens, 0, 96, 0, 100);

    rotate(TWO_PI / totalBirds);
    noStroke();
    fill(c, 200, 255);
    rect(0, 200, barWidth, barLength);
  } 
  popMatrix();
}



// ---------------------------------- numbers & names 2011
void birdData2011() {

  translate(width-338, (height/2)-20);
  for (int i = 0; i < birds.size(); i++) {
    allBirds b = birds.get(i);

    float barLength = map(b.perGardens, 0, 96, 0, 100);

    rotate(TWO_PI / 74);  
    PFont plain; 
    plain = loadFont("Helvetica-48.vlw");
    textFont(plain, 9);
    float c = 255 - map(Math.abs(b.perGardens), 0, 96, 0, 255); 
    fill(c, 200, 255);
    pushMatrix();
    rotate(PI/2);
    text(int(b.perGardens), 185, i-i);  
     text(b.species, barLength+205, i-i);  

    popMatrix();
  }
}



// ---------------------------------- load CSV into String of rows
void loadData() {
  String[] rows = loadStrings("UKBIRDS.csv");
  for (int i = 0; i < 73; i++) {   
    allBirds ab = new allBirds();
    ab.fromCSV(rows[i].split(","));

    birds.add(ab);
  }
}



//void keyFunction
//if keyPressed(){
//  if(key == 'x') birds2011();
//}

