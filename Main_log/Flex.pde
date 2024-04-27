void flex_draw(){
 PImage flex_bg;
 PImage elbow;
 PImage wrist;
 PImage panel1;
 PImage panel2;
 flex_bg = loadImage("images/flex.jpg");
 elbow = loadImage("images/elbow.png");
 wrist = loadImage("images/wrist.png");
 panel1 = loadImage("images/panel1.jpg");
 panel2 = loadImage("images/panel2.png");
 
 
 
 
background(flex_bg);
fill(0);

textSize(24);
text("Where is the flex Sensor Located?",320,50);

textSize(38);
fill(255);
image(panel2,width/2-350,height/2-300,700,250);
image(wrist,width-250,height/2-300,200,200);
text("WRIST",width-600,height/2-170);



fill(0);
text("OR", width/2-30,height/2+45);

fill(255);
image(panel1,width/2-350,height/2+150,700,250);
image(elbow,width/2-300,height/2+150,250,250);

text("ELBOW",width-100,height/2+280);
noFill();
home_button();
}
