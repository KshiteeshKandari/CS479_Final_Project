//makinga repo
String tab = "home";
void setup() {
  size(700, 1000); // iPhone 6/7/8 screen dimensions (portrait mode)
  home_setup();
  // Add other interface elements here
}

void draw() {
  // Add animations or dynamic elements here
  
  if(tab == "mode1"){
    mode1_draw();
  }
  else if(tab == "home"){
    home_draw();
  }
  else if(tab == "credit"){
    mode2_draw();
  }
}
