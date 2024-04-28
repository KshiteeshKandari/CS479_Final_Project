PImage wr_bg;
PImage wr_st;
PImage wr_bt;


void wrist_setup(){
 wr_bg = loadImage("images/wrist_bg.jpg");
 wr_st = loadImage("images/wrist_st.png");
 wr_bt = loadImage("images/wrist_bt.png");
}


void wrist_draw(){
  background(wr_bg);
  home_button();
  translate(width / 2, height / 4); // Center the origin in the middle of the canvas
  drawFace(); // Draw the face of the angle meter
  updateAngle(); // Update the angle of the pointer
  drawPointer(); // Draw the pointer
  manageAngleUpdate();
  labelTicks(); // Label the ticks with the angle values
  displayFlexAngle();
  home_button();
  
  if (angle < radians(4)) {
    image(wr_st, -400, height / 5); // Adjust the y coordinate as needed
  } else if (angle > radians(5)) {
    image(wr_bt, -400, height / 5); // Adjust the y coordinate as needed
  }
  
}
