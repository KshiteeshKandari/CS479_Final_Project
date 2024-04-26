PFont font;
PImage bgImage;
PImage but;
Button getStartedButton;
int buttonX, buttonY, buttonWidth, buttonHeight;

void start_setup(){
  font = createFont("YourFontName.ttf", 16); // Replace with your font file
  bgImage = loadImage("images/Start.png"); // Load your image
  but = loadImage("images/get.png");
  buttonX = width / 3 + 10;
  buttonY = height - 200;
  buttonWidth = 200;
  buttonHeight = 40;
}


void start_draw(){
  background(bgImage);

  
  image(but, buttonX, buttonY, buttonWidth, buttonHeight); 
}

//void mouseClicked() {
//  // Check if the mouse click is within the button bounds
//  if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
//      mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {
//    goToNextPage(); // Call the function to handle the page transition
//  }
//}

void goToNextPage() {
  // Implement the action to be performed on clicking the button
  tab = "home" ;
}
  
