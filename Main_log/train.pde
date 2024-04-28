int gap = 20;
int buttWidth = 150;
int buttHeight = 150;

PImage train_bg;
PImage pinch;
PImage crimp;
PImage sloper;
PImage jugs;

void train_setup() {
  train_bg = loadImage("images/train.jpg");
  pinch = loadImage("images/pinch.png");
  crimp = loadImage("images/crimp.png");
  sloper = loadImage("images/sloper.png");
  jugs = loadImage("images/jugs.png");
}


void train_draw() {
  background(train_bg);
  
  // Set the size of the buttons and the gap between them
  int gap = 20;
  
  // Display pinch button
  image(pinch, gap, height - buttHeight - gap, buttWidth, buttHeight);
  textAlign(CENTER, CENTER);
  text("Pinch", gap + buttWidth/2, height - gap - buttHeight - 20);
  
  // Display crimp button
  image(crimp, 2*gap + buttWidth, height - buttHeight - gap, buttWidth, buttHeight);
  textAlign(CENTER, CENTER);
  text("Crimp", 2*gap + buttWidth + buttWidth/2, height - gap - buttHeight - 20);
  
  // Display sloper button
  image(sloper, 3*gap + 2*buttWidth, height - buttHeight - gap, buttWidth, buttHeight);
  textAlign(CENTER, CENTER);
  text("Sloper", 3*gap + 2*buttWidth + buttWidth/2, height - gap - buttHeight - 20);
  
  // Display jugs button
  image(jugs, 4*gap + 3*buttWidth, height - buttHeight - gap, buttWidth, buttHeight);
  textAlign(CENTER, CENTER);
  text("Jugs", 4*gap + 3*buttWidth + buttWidth/2, height - gap - buttHeight - 20);
  
  // Call the function to create a home button
  home_button();
}

void mousePressed() {
  // Check if mouse is within the area of the pinch button
  if (mouseX >= gap && mouseX <= gap + buttWidth && mouseY >= height - buttHeight - gap && mouseY <= height - gap) {
    // Add action for pinch button click
    println("Pinch button clicked!");
  }
  
  // Check if mouse is within the area of the crimp button
  if (mouseX >= 2*gap + buttWidth && mouseX <= 2*gap + 2*buttWidth && mouseY >= height - buttHeight - gap && mouseY <= height - gap) {
    // Add action for crimp button click
    println("Crimp button clicked!");
  }
  
  // Check if mouse is within the area of the sloper button
  if (mouseX >= 3*gap + 2*buttWidth && mouseX <= 3*gap + 3*buttWidth && mouseY >= height - buttHeight - gap && mouseY <= height - gap) {
    // Add action for sloper button click
    println("Sloper button clicked!");
  }
  
  // Check if mouse is within the area of the jugs button
  if (mouseX >= 4*gap + 3*buttWidth && mouseX <= 4*gap + 4*buttWidth && mouseY >= height - buttHeight - gap && mouseY <= height - gap) {
    // Add action for jugs button click
    println("Jugs button clicked!");
  }
}
