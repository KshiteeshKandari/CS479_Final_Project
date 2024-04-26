
int minFSRValue = 0; // Minimum expected value for FSR input
int maxFSRValue =2; // Maximum expected value for FSR input
int heatmapDiameter; // Diameter of each individual heatmap
int[][] fsrValues; // 2D Array to store FSR values for each sensor
ArrayList<ArrayList<Integer>> fsrHistory; // To store a history of values for drawing the graphs
PFont f;



void mode1_setup(){
  int sensors = 4;
  fsrValues = new int[sensors][20];// More sensor points for a smoother gradient
  f = createFont("font/f.ttf",24);

  heatmapDiameter = width / 12; // Choose an appropriate size for the individual heatmaps

  //frameRate(10); // Reduce the frame rate to make it less flickery
}


void mode1_draw(){
  PImage hand;
  PImage pt;
  PImage m1_bg;
  
  
  hand = loadImage("images/hand.png");
  pt = loadImage("images/prompt.png");
  m1_bg = loadImage("images/mode1.jpg");
  background(m1_bg);
  
  home_button();
  
  image(hand,10,10,600,900);
  image(pt,-70,700,850,500);
  
  writeText(15, 950);
  // Simulate live FSR values updating for each sensor
   for (int j = 0; j < fsrValues.length; j++) {
    for (int i = 0; i < fsrValues[j].length; i++) {
      int newValue = (int)random(minFSRValue, maxFSRValue + 1);
      fsrValues[j][i] = (fsrValues[j][i] + newValue) / 2; // Average with the previous value for smoothing
    }
  }
   // Draw heatmaps for each sensor on the left
    drawCircularHeatmap(fsrValues[0], (width / 4)+300, (height / 5)+300, heatmapDiameter);
    //print(fsrValues[0]);
    drawCircularHeatmap(fsrValues[1], width / 2-30, 2 * height / 5 -40, heatmapDiameter);
    drawCircularHeatmap(fsrValues[2], (width / 3)+40, 3 * (height / 7)+200, heatmapDiameter);
    drawCircularHeatmap(fsrValues[3], (width / 2), 3 * (height / 5)+100, heatmapDiameter);
 }


void drawCircularHeatmap(int[] sensorValues, float centerX, float centerY, int diameter) {
  noStroke();
  int limeGreen = color(50, 205, 50); // Lime green color
  int red = color(255, 0, 0); // Red color
  int highestValue = max(sensorValues); // Find the max value for the most intense part of the gradient

  // Cap for the diameter of the red center
  float maxCenterDiameter = diameter / 10; // For example, let's say we don't want it to be more than a quarter of the total diameter
  float normalizedValue = map(highestValue, minFSRValue, maxFSRValue, 0, maxCenterDiameter);

  // Draw concentric circles from the center
  for (int i = diameter / 2; i >= 0; i--) {
    float lerpFactor = map(i, 0, diameter / 2, 0, 1); // Factor for interpolating the color
    float currentDiameter = map(i, 0, diameter / 2, normalizedValue, diameter);
    int currentColor = lerpColor(red, limeGreen, lerpFactor);

    fill(currentColor);
    ellipse(centerX, centerY, currentDiameter, currentDiameter);
  }
}

void writeText(int x , int y){
  textFont(f);
  
  textSize(34); 
  stroke(0);// Set the text size to 42
  fill(0); // Set the fill color to blue (RGB)
  text("You are focusing too much on X grip", x, y);
}
