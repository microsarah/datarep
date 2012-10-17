class allBirds {
  
  String species;  // ------- what I want to look at in the data
//  int filmYear;
//  String actor;
  
//  int species;
  float average;
  float rank;
  float perGardens;
  float avg2010;
  float rank2010;
  float perGardens2010;
  float perChange;
  
  // pass a string array into a function
  void fromCSV(String[] input){
    
    //Species  Average  Rank  PercentGardens  Average2010  Rank2010  PercentGardens2010  PercentChange
    species = input[0];
    
    average = float(input[1]);
    rank = float(input[2]);
    perGardens = float(input[3]);
    avg2010 = float(input[4]);
    rank2010 = float(input[5]);
    perGardens2010 = float(input[6]);
    perChange = float(input[7]);
  }
}
