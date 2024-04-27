//import processing.serial.*;
//Serial myPort;

String tab = "home";
float fade = 255;  // For fade-in and fade-out effect
boolean transitioning = false;

PImage home;
PFont f;

//int lower;
//int center;
//int finger;
//int thumb;
//int flex;
//int emg;

void setup() {
  
  //String portName = Serial.list()[0];
  //print(Serial.list());
  //myPort = new Serial(this, portName, 115200);
  //myPort.bufferUntil('\n');
  
  size(700, 1000); // iPhone 6/7/8 screen dimensions (portrait mode)
  home_setup();
  mode1_setup();
  start_setup();
  mode2_setup();
  elbow_setup();
  wrist_setup();
  home = loadImage("images/home.png");
  f = createFont("font/f.ttf",24);
  textFont(f);
  // Initialize other setups if necessary
}

void draw() {
  if (!transitioning) {
    switch (tab) {
      case "start":
        start_draw();
        break;
      case "home":
        home_draw();
        break;
      case "mode1":
        mode1_draw();
        break;
      case "mode2":
        mode2_draw();
        break;
      case "flex":
        flex_draw();
        break;
      case "train":
        train_draw();
        break;
      case "wrist":
        wrist_draw();
        break;
      case "elbow":
        elbow_draw();
        break;
    }
  } else {
    // The draw function will keep calling fadeIn until transitioning is false
    if (fade > 0 && fade < 255) {
      fadeOut();  // Continues fading out until fade reaches 0
    } else {
      fadeIn();  // Continues fading in until fade reaches 255
    }
  }
}

void fadeOut() {
  fade -= 10;
  fill(0, 255 - fade);
  rect(0, 0, width, height); // Draw fading rectangle
  if (fade <= 0) {
    fade = 0; // Ensure fade does not go below 0
    transitioning = true; // Transitioning continues, allowing fadeIn to start
  }
}

void fadeIn() {
  fade += 10;
  fill(0, 255 - fade);
  rect(0, 0, width, height); // Draw fading rectangle
  if (fade >= 255) {
    fade = 255;
    transitioning = false; // End transition
  }
}

//void serialEvent(Serial myPort){
//  String tempVal = myPort.readStringUntil('\n');
//  if (tempVal != null){
//    String[] values = split(tempVal, ' ');
//    lower = int(values[0]);
//    center = int(values[1]);
//    finger = int(values[2]);
//    thumb = int(values[3]);
//    flex = int(values[4]);
//    emg = int(values[5]);
//  }  
//}

void mouseClicked() {
  //println(mouseX, mouseY);
  //print(tab);
  if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
      mouseY >= buttonY && mouseY <= buttonY + buttonHeight){
    if (tab == "start" && !transitioning) {
      transitioning = true; // Start transition
      tab = "home"; // Set next tab to 'home'
    }
  }
  if (tab == "mode1" || tab == "mode2" || tab == "flex"|| tab == "train" || tab == "wrist"|| tab == "elbow"){
  
   if (mouseX >= 50 && mouseX <= width-70+50 && mouseY >= 20 && mouseY <= 20+50){
      tab = "home";
      }
  }
  if (tab == "flex"){
    if (mouseX > 0 && mouseX < width && mouseY > 50 && mouseY < 450) {
        tab = "wrist";

     }
    if (mouseX > 0 && mouseX < width && mouseY > 650 && mouseY < 900) {
      tab = "elbow";
  }
  if(tab == "elbow"){
   targetAngle = random(TWO_PI);
   print(targetAngle);
  }
  }
}

void home_button(){

image(home,width-70,20,50,50);

}
