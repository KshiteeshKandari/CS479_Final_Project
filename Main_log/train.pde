  long lastIncrementTime = 0;
  long incrementInterval = 2500; 
  
  
  int flex_count = 0;
  int muscle_count = 0;
 int gap = 20;
void train_draw() {
  PImage train_bg;
  train_bg = loadImage("images/train.jpg");
  PImage pinch = loadImage("images/pinch.png");
  PImage crimp = loadImage("images/crimp.png");
  PImage sloper = loadImage("images/sloper.png");
  PImage jugs = loadImage("images/jugs.png");

  background(train_bg);

  // Set the size of the buttons and the gap between them
  int buttonWidth = 150;
  int buttonHeight = 150;



//count the amount of errors during climbing
//-------------------------------------------------------
// add this when we implement everything
  if(millis() - lastIncrementTime >= incrementInterval){
    if (flex > 0){
      flex_count++;
      //println(flex_count);
    }
    if (emg > 500){
      muscle_count++;
      //println(muscle_count);
    }
    lastIncrementTime = millis();
  }
  println(flex_count, muscle_count);
//---------------------------------------------------------
//currently only currentEmg is working, not sure how to update the angle with what ash's code
  //updateAngle();
  //manageAngleUpdate();
  //updateEmgData();
  //if(angle > 100 || currentEmg > 380){
  //count++;
  //println(count);
  //}  
//-----------------------------------------------------  need to print out information on the top part of the code, make reset button
  
  stroke(0); // Black color
  strokeWeight(3);
  line(0, height/3, width, height/3); // Line from left edge to right edge, at middle height

  // Draw background rectangles for buttons
  fill(255, 100); // White with transparency
  noStroke(); // No border
  
  //do we want borders for the buttons or not?
  rect(gap, height - buttonHeight - gap, buttonWidth, buttonHeight); // Pinch button
  rect(2*gap + buttonWidth, height - buttonHeight - gap, buttonWidth, buttonHeight); // Crimp button
  rect(3*gap + 2*buttonWidth, height - buttonHeight - gap, buttonWidth, buttonHeight); // Sloper button
  rect(4*gap + 3*buttonWidth, height - buttonHeight - gap, buttonWidth, buttonHeight); // Jugs button

  // Display pinch button
  image(pinch, gap, height - buttonHeight - gap, buttonWidth, buttonHeight);
  textAlign(CENTER, CENTER);
  fill(0); // Black text color
  text("Pinch", gap + buttonWidth/2, height - gap - buttonHeight - 20);

  // Display crimp button
  image(crimp, 2*gap + buttonWidth, height - buttonHeight - gap, buttonWidth, buttonHeight);
  textAlign(CENTER, CENTER);
  text("Crimp", 2*gap + buttonWidth + buttonWidth/2, height - gap - buttonHeight - 20);

  // Display sloper button
  image(sloper, 3*gap + 2*buttonWidth, height - buttonHeight - gap, buttonWidth, buttonHeight);
  textAlign(CENTER, CENTER);
  text("Sloper", 3*gap + 2*buttonWidth + buttonWidth/2, height - gap - buttonHeight - 20);

  // Display jugs button
  image(jugs, 4*gap + 3*buttonWidth, height - buttonHeight - gap, buttonWidth, buttonHeight);
  textAlign(CENTER, CENTER);
  text("Jugs", 4*gap + 3*buttonWidth + buttonWidth/2, height - gap - buttonHeight - 20);
  
  home_button();
}

void mousePressed() {
  // Check if mouse is within the area of the pinch button
  if (mouseX >= gap && mouseX <= gap + 150 && mouseY >= height - 200 && mouseY <= height - gap) {
    // Pinch button clicked
    println("Pinch button clicked!");
  }

  // Check if mouse is within the area of the crimp button
  if (mouseX >= 2*gap + 150 && mouseX <= 2*gap + 300 && mouseY >= height - 200 && mouseY <= height - gap) {
    // Crimp button clicked
    println("Crimp button clicked!");
  }

  // Check if mouse is within the area of the sloper button
  if (mouseX >= 3*gap + 300 && mouseX <= 3*gap + 450 && mouseY >= height - 200 && mouseY <= height - gap) {
    // Sloper button clicked
    println("Sloper button clicked!");
  }

  // Check if mouse is within the area of the jugs button
  if (mouseX >= 4*gap + 450 && mouseX <= 4*gap + 600 && mouseY >= height - 200 && mouseY <= height - gap) {
    // Jugs button clicked
    println("Jugs button clicked!");
  }
}
