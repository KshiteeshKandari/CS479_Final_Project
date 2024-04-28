float angle = 0; // Current angle of the pointer
float targetAngle = 0; // Target angle for the pointer
int updateInterval = 100; // Time in frames before updating the angle
int timeSinceLastUpdate = 0; // Time counter

PImage bt1; // Assuming bt1 is already loaded
PImage bt2; // Assuming bt2 is already loaded
PImage el_bg;


void elbow_setup(){

  frameRate(30);
  targetAngle = random(TWO_PI);
  bt1 = loadImage("images/el_st.png"); // Load the image bt1.png
  bt2 = loadImage("images/el_bt.png"); // Load the image bt2.png
  el_bg = loadImage("images/elbow_bg.jpg");
}


void elbow_draw(){
   background(el_bg);
   home_button();
  translate(width / 2, height / 4); // Center the origin in the middle of the canvas
  drawFace(); // Draw the face of the angle meter
  updateAngle(); // Update the angle of the pointer
  drawPointer(); // Draw the pointer
  manageAngleUpdate();
  labelTicks(); // Label the ticks with the angle values
  displayFlexAngle();
   // Draw the image in the center of the canvas based on the angle
  //imageMode(CENTER); // Ensure the images are drawn centered on their coordinates
  if (angle < radians(4)) {
    image(bt1, -300, height / 6); // Adjust the y coordinate as needed
  } else if (angle > radians(5)) {
    image(bt2, -210, height / 8-50); // Adjust the y coordinate as needed
  }
  
  // Reset the translation for other drawing functions
  translate(0, 0);

}

void drawFace() {
  // Draw the outer semicircle
   noFill();
  stroke(0);
  strokeWeight(2);
  arc(0, 0, 300, 300, PI, TWO_PI);
  
  // Draw angle marks on the upper side
  for (int i = 0; i <= 180; i += 10) {
    float rad = radians(i);
    float innerX = cos(PI + rad) * 145;
    float innerY = sin(PI + rad) * 145;
    float outerX = cos(PI + rad) * 150;
    float outerY = sin(PI + rad) * 150;
    line(innerX, innerY, outerX, outerY);
  }
  
}

void drawPointer() {
  // Draw the pointer with current angle
  stroke(255, 0, 0);
  strokeWeight(2);
  line(0, 0, cos(PI + angle) * 140, sin(PI + angle) * 140);
  noStroke();
  
}

void updateAngle() {
  // Smoothly transition the pointer to the target angle
  if (abs(angle - targetAngle) > 0.01) {
    angle += (targetAngle - angle) * 0.05;
  }
}

void manageAngleUpdate() {
  // Update the target angle periodically
  float inputAngle = map(flex, 0, 45, 0, HALF_PI); // Map input values to angle range (0 to 90 degrees)
  targetAngle = inputAngle; // Set the target angle
  timeSinceLastUpdate++; // Increment the time counter
}

void labelTicks() {
  // Label the ticks with the angle values
  textSize(12);
  fill(0);
  textAlign(CENTER, CENTER);
  for (int i = 0; i <= 180; i += 30) {
    float rad = radians(i);
    float x = cos(PI + rad) * 165;
    float y = sin(PI + rad) * 165;
    text(i, x, y);
  }
}

void displayFlexAngle() {
  // Display the current flex angle below the dial
  String angleText = "Flex Angle: " + nf(degrees(angle), 0, 2) + "°";
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER);
  text(angleText, 0, 100); // Adjust the position as needed
}
