PImage forearm1, forearm2;
boolean showFirstImage = true;

int[] emgData;
int graphWidth;
int maxValue = 400; // Simulated maximum value for EMG data
int minValue = 0; // Simulated minimum value for EMG data
int dataPointSpacing = 3; // Spacing between data points
int leftMargin = 60; // Margin for the y-axis
int bottomMargin = 50; // Margin for the x-axis
int dataPoints;
int graphHeight;
float startTime; // Start time in seconds
float currentTime; // Current time in seconds
int currentEmg;
// Additional variables for dynamic x-axis labels
float graphStartTime; // The start time of the graph
float graphDuration = 10.0; // Duration of the graph window in seconds
int labelFrequency = 2; // Frequency of labels in seconds

void mode2_setup() {

  forearm1 = loadImage("images/forearm1.png"); // Load the first image
  forearm2 = loadImage("images/forearm2.png"); // Load the second image
  graphWidth = width - leftMargin;
  dataPoints = graphWidth / dataPointSpacing;
  graphHeight = (height / 2) - bottomMargin;
  emgData = new int[dataPoints];
  frameRate(30);
}

void mode2_draw() {
  currentTime = millis() / 1000.0; // Update the current time
  float elapsedTime = currentTime - startTime; // Calculate elapsed time since start
  PImage m2_bg;
  m2_bg = loadImage("images/mode2.jpg");

  background(m2_bg);
  home_button(); // Ensure you have a function to draw the home button

  updateEmgData();

  // Translate the canvas to the middle for graph drawing
  translate(0, height / 2);
  drawGraph();
  drawAxes();
  labelAxes();
  //drawXAxisLabels(elapsedTime);

  // Reset translation
  translate(0, -height / 2);
  
   //updateXAxisLabels();

  if (emgData[0]> 200) {
    image(forearm1, width - forearm1.width, height / 4 - forearm1.height / 2); // Display the first image on the top right
  } else {
    image(forearm2, width - forearm2.width, height / 4 - forearm2.height / 2); // Display the second image on the top right
  }
}

void updateEmgData() {
  for (int i = emgData.length - 1; i > 0; i--) {
    emgData[i] = emgData[i - 1];
  }
  currentEmg = (int)random(minValue, maxValue);
  emgData[0] = currentEmg; // Generate a new random data point
}

void drawGraph() {
  noFill();
  stroke(0, 0, 255);
  beginShape();
  for (int i = 0; i < emgData.length; i++) {
    float y = map(emgData[i], minValue, maxValue, graphHeight, 0);
    vertex(leftMargin + i * dataPointSpacing, y);
  }
  endShape();
}

void drawAxes() {
  stroke(0);
  // Y-axis
  line(leftMargin, 0, leftMargin, graphHeight);
  // X-axis
  line(leftMargin, graphHeight, width, graphHeight);
}

void labelAxes() {
  fill(0);
  textSize(12);
  textAlign(RIGHT, CENTER);

  // Y-axis labels
  for (int i = minValue; i <= maxValue; i += maxValue / 10) {
    float y = map(i, minValue, maxValue, graphHeight, 0);
    text(i, leftMargin - 10, y);
  }
  int timeStep = dataPoints / 10; // Adjust this for your specific time step
  for (int i = 0; i < dataPoints; i += timeStep) {
    float x = leftMargin + i * dataPointSpacing;
  }

  // Label titles
  textAlign(CENTER, CENTER);
  // Y-axis title
  pushMatrix();
  translate(20, graphHeight / 2);
  rotate(-HALF_PI);
  text("EMG Value", 0, 0);
  popMatrix();
  // X-axis title
  text("Time", width / 2, graphHeight + 40);
}
