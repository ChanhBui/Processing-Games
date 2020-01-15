int xpos=60;
float ypos=150;
PFont f;
int score;
int [] columnx= new int[2];
int [] heightTop=new int[2];
int [] holeWidth=new int[2];
int column = 0;
float Random=0;
float angle = 0;



void setup(){
f = createFont("Arial",16,true);
frameRate(80);
size(800,800);
background(255);
columnx[0]=-800;
columnx[1]=-800;
}



void draw(){

  background(255);
  fill(#0cffca);
  stroke(0,0,0,450);
  ellipse(xpos,ypos,50,50);
  Random = random(40.0);
  
  
  columnRandomizer();
  
  drawColumn(); // draw the column
  
  isDead(); // check if the birs is dead
  
  updateScore(); // update Score
  
  columnx[0]=columnx[0]-2;
  columnx[1]=columnx[1]-2;
  ypos=ypos+2 ;
  
  fill(0);
  textSize(32);
  text("Score: " + score,600,50);
  
}


//extra method



// end game condition
void isDead(){
  if((ypos<heightTop[0]+21 || ypos >heightTop[0]+ holeWidth[0] - 21) && (xpos+20>columnx[0] && xpos-20 < columnx[0]+80)){
    fill(230);
    rect(150,250,500,300);
    textSize(50);
    fill(0);
    text("Final Score: " + score,250,350);
    text("Press R to restart",200,450);
    noLoop();
  }
  
  if((ypos<heightTop[1]+21 || ypos >heightTop[1]+ holeWidth[1] - 21) && (xpos+20>columnx[1] && xpos-20 < columnx[1]+80)){
    fill(230);
    rect(150,250,500,300);
    textSize(50);
    fill(0);
    text("Final Score: " + score,250,350);
    text("Press R to restart",200,450);
    noLoop();
  }
  
  if(ypos>780){
    fill(230);
    rect(150,250,500,300);
    textSize(50);
    fill(0);
    text("Final Score: " + score,250,350);
    text("Press R to restart",200,450);
    noLoop();
  }
}



//update the score
void updateScore(){
   if(xpos==columnx[0]+86){
      score++; 
   }
   if(xpos==columnx[1]+86){
      score++; 
   }
}



// randomizer for the column
void columnRandomizer(){
    if (Random < 1 && columnx[0]<-80 && columnx[1]<400){
    heightTop[0]=int(random(100,500));
    columnx[0]=800;
    holeWidth[0]=int(random(140,200));
    }
    
    if (Random < 1 && columnx[1]<-80 && columnx[0]<400){
    heightTop[1]=int(random(100,500));
    columnx[1]=800;
    holeWidth[1]=int(random(140,200));
    }
}


//Column drawer
void drawColumn(){
  fill(#32ef48);
  if (columnx[0]>-80){
    rect(columnx[0],0,80,heightTop[0]);
    rect(columnx[0],heightTop[0]+holeWidth[0],80,800-heightTop[0]+holeWidth[0]);
  }
  if (columnx[1]>-80){
    rect(columnx[1],0,80,heightTop[1]);
    rect(columnx[1],heightTop[1]+holeWidth[1],80,800-heightTop[1]+holeWidth[1]);
  }
}



void keyPressed(){
  ypos=ypos-60;
  if (key == 'r' || key == 'R'){
    score = 0 ;
    xpos=60;
    ypos=150;
    columnx[0]=-800;
    columnx[1]=-800;
    loop();
  }
}
  
  
  
