Button mode1Button;
Button mode2Button;
Button mode3Button;
boolean mode1Clicked = false;
boolean mode2Clicked = false;
boolean mode3Clicked = false;
//String tab = ""; // Variable to store the active tab

void home_setup() {
  // Create buttons
  mode1Button = new Button(width/2 - 100, 200, 200, 50, "Mode 1");
  mode2Button = new Button(width/2 - 100, 300, 200, 50, "Mode 2");
  mode3Button = new Button(width/2 - 100, 400, 200, 50, "Mode 3");
}

void home_draw() {
  PImage home_background;
  PImage logo1;
  
  logo1 = loadImage("images/climbing.png");
  home_background = loadImage("Main.png");
  
  background(home_background);
  
  // Draw buttons
  mode1Button.display();
  mode2Button.display();
  mode3Button.display();
  
  // Check if any button is clicked and change appearance
  if (mode1Button.isClicked()) {
    println("Mode 1 button clicked");
    mode1Clicked = true;
  }
  if (mode2Button.isClicked()) {
    println("Mode 2 button clicked");
    mode2Clicked = true;
  }
  if (mode3Button.isClicked()) {
    println("Mode 3 button clicked");
    mode3Clicked = true;
  }
  
  // Process button clicks
  processButtonClicks();
}

void processButtonClicks() {
  if (mode1Clicked) {
    mode1Clicked = false;
    tab = "mode1";
  }
  if (mode2Clicked) {
    mode2Clicked = false;
    // Add action for Mode 2 button
  }
  if (mode3Clicked) {
    mode3Clicked = false;
    // Add action for Mode 3 button
  }
}

class Button {
  float x, y, w, h;
  String label;
  
  Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
  }
  
  void display() {
    // Check if mouse is over the button
    if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
      fill(255, 150); // Translucent white color when mouse is over
    } else {
      fill(255, 100); // Translucent white color
    }
    rect(x, y, w, h);
    
    textAlign(CENTER, CENTER);
    textSize(16);
    fill(0); // Black text color
    text(label, x + w/2, y + h/2);
  }
  
  boolean isClicked() {
    return (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h && mousePressed);
  }
}
