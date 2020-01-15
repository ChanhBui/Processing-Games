
PFont f;
IntList inventory;
int mineLeft;
int time;
Square[][] table = new Square[22][22]; 

void setup(){
  f = createFont("Arial",16,true);
  frameRate(80);
  size(801,901);
  background(255);
  strokeWeight(2);
  inventory= new IntList();

  resetTable(); //new Game created
  update();

  
  
}



void draw(){
background(255);
fill(0);
textSize(50);
text("Mine Left: " + mineLeft,25,70);

drawTable(); 

showAll();
fill(0);
text("Time: " + int((millis()-time)/1000),500,70);
checkWin();
}



//extra method
void update(){
  for(int row=1; row<21;row++){
   for(int column=1; column<21;column++){
     if(table[row][column].getValue()!=-1){
       for(int nearRow = row-1; nearRow<row+2;nearRow++){
         for(int nearCol = column -1; nearCol < column +2;nearCol++){
           if (table[nearRow][nearCol].getValue() == -1){
             table[row][column].advanceValue(); 
           }
         }
       }
     }
   }
 }
  
}

void showAllMine(){
  for(int row=1; row<21;row++){
   for(int column=1; column<21;column++){
     if(table[row][column].getValue() == -1){
       table[row][column].setShow(1);
       table[row][column].show();
     }
   }
 }
}

void showAll(){
  for(int row=1; row<21;row++){
   for(int column=1; column<21;column++){
     table[row][column].show();
   }
 }
}


void resetTable(){
 for(int row=0; row<22;row++){
   for(int column=0; column<22;column++){
     table[row][column] = new Square(0, row*40+1-40,column*40+61);
   }
 }
  
  for(int i=1;i<401;i++){
    inventory.append(i);
  }
  inventory.shuffle();
  
  for(int i=0;i<40;i++){
    int temp = inventory.get(i);
    temp=temp-1;
    int column = temp%20+1;
    int row = int(temp/20)+1;
    table[row][column].setValue(-1);
    time=millis();
    mineLeft=40;
  } 
}


void drawTable(){
  fill(#ffefef);
  for (int y=101;y<900;y=y+40){
    for(int x=1;x<800;x=x+40){
      rect(x,y,39,39);
    }
  }
}


void mousePressed(){
  if (mouseButton == RIGHT){
    if(pmouseY>100){ 
      int x = int(pmouseX/40)+1;
      int y = int((pmouseY-100)/40)+1;
      if(table[x][y].getShow()==0){
        table[x][y].setShow(-1);
        mineLeft=mineLeft-1;
      }
      else if (table[x][y].getShow()==-1){
        table[x][y].setShow(0);
        mineLeft++;
      }
    }
  }
  
  if (mouseButton ==LEFT){
    if(pmouseY>100){ 
      int x = int(pmouseX/40)+1;
      int y = int((pmouseY-100)/40)+1;
      if(table[x][y].getShow()==0){
        table[x][y].setShow(1);
        if(table[x][y].getValue()==0){
          showSurrounding();
        }
        if(table[x][y].getValue()==-1){
          table[x][y].show();
          noLoop();
          showAllMine();
          Lose();
        }
      }
    }
  }
}

void showSurrounding(){
  for(int i=0;i<20;i++){
    for(int row=1; row<21;row++){
     for(int column=1; column<21;column++){
       if(table[row][column].getValue()!=-1){
         for(int nearRow = row-1; nearRow<row+2;nearRow++){
           for(int nearCol = column -1; nearCol < column +2;nearCol++){
             if (table[nearRow][nearCol].getValue() == 0 &&table[nearRow][nearCol].getShow()== 1){
               table[row][column].setShow(1); 
             }
           }
         }
       }
     }
  }
 }
}

void checkWin(){
  for(int row=1; row<21;row++){
   for(int column=1; column<21;column++){
     if(table[row][column].getValue()!=-1 && table[row][column].getShow()!=1){
       return;
     }
   }
 }
  Win();
}


void Win(){
  fill(230);
    rect(150,250,500,300);
    textSize(50);
    fill(0);
    text("You Win!!!", 275,300);
    text("Your time: " + int((millis()-time)/1000),250,400);
    text("Press R to restart",200,500);
    noLoop();
}

void Lose(){
  fill(230);
    rect(150,250,500,300);
    textSize(50);
    fill(0);
    text("You lose!!!", 275,300);
    text("Your time: " + int((millis()-time)/1000),250,400);
    text("Press R to restart",200,500);
    noLoop();
}


void keyPressed(){

  if (key == 'r' || key == 'R'){
    resetTable();
    update();
    loop();
  }
}
