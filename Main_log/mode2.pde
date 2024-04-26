PImage forearm1, forearm2;
boolean showFirstImage = true; 

void mode2_setup(){
  forearm1 = loadImage("images/forearm1.png"); // Load the first image
  forearm2 = loadImage("images/forearm2.png"); // Load the second image
}



void mode2_draw(){
PImage m2_bg;
m2_bg = loadImage("images/mode2.jpg");


background(m2_bg);
home_button();

if (showFirstImage) {
    image(forearm1, 0,0); // Display the first image
  } else {
    image(forearm2, 0, 0); // Display the second image
  }

}

void keyPressed() {
  if (key == ' ') { // Check if the space bar is pressed
    showFirstImage = !showFirstImage; // Toggle the boolean to switch images
  }
}
