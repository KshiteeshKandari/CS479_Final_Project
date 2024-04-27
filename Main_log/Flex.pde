void flex_draw(){
 PImage flex_bg;
 PImage elbow;
 PImage wrist;
 PImage panel1;
 flex_bg = loadImage("images/flex.jpg");
 elbow = loadImage("images/elbow.png");
 wrist = loadImage("images/wrist.png");
 panel1 = loadImage("images/panel1.jpg");
 
 
 
 
background(flex_bg);
fill(0);

textSize(24);
text("Where is the flex Sensor Located?",320,50);

textSize(38);

image(wrist,width-250,height/2-300,200,200);
text("WRIST",width-600,height/2-170);
noFill();
rect(10,height/2-300,680,250);

text("OR", width/2-30,height/2+45);


image(panel1,width/2-350,height/2+150,700,250);
image(elbow,width/2-300,height/2+150,250,250);
fill(255);
text("ELBOW",width-200,height/2+280);

home_button();
}
