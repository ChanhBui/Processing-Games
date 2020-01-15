class Square{
  int value, xpos, ypos, show;

  
  Square (int a,int b,int c){
    value=a;
    xpos=b;
    ypos = c;
    show = 0;
  }
  
  int getXPos(){
    return xpos;
  }
  
  int getYPos(){
    return ypos;
  }
  
  int getValue(){
    return value;
  }
  
  int getShow(){
    return show;
  }
  
  void setValue(int a){
    value=a;
  }
  
  void advanceValue(){
    value++;
  }
  
  void setShow(int a){
    show=a;
  }
  
  void show(){
    if(show == 1){
    
      textSize(30);
    
      if (value ==-1){
        fill(#c0c0c0);
        rect(xpos,ypos,40,40);
        fill(0);
        ellipse(xpos+20,ypos+20,30,30);
      }
      if (value ==0){
        fill(#c0c0c0);
        rect(xpos,ypos,40,40);
      }
      if (value ==1){
        fill(#c0c0c0);
        rect(xpos,ypos,40,40);
        fill(#054ec4);
        text(1,xpos+12,ypos+35);
      }
      if (value ==2){
        fill(#c0c0c0);
        rect(xpos,ypos,40,40);
        fill(#ff6600);
        text(2,xpos+12,ypos+35);
      }
      if (value ==3){
        fill(#c0c0c0);
        rect(xpos,ypos,40,40);
        fill(#cc0000);
        text(3,xpos+12,ypos+35);
      }
      if (value ==4){
        fill(#c0c0c0);
        rect(xpos,ypos,40,40);
        fill(#660066);
        text(4,xpos+12,ypos+35);
      }
      if (value ==5){
        fill(#c0c0c0);
        rect(xpos,ypos,40,40);
        fill(0);
        text(5,xpos+12,ypos+35);
      }
      if (value ==6){
        fill(#c0c0c0);
        rect(xpos,ypos,40,40);
        fill(#ccccff);
        text(6,xpos+12,ypos+35);
      }
      if (value ==7){
        fill(#c0c0c0);
        rect(xpos,ypos,40,40);
        fill(#99ff99);
        text(7,xpos+12,ypos+35);
      }
      if (value ==8){
        fill(#c0c0c0);
        rect(xpos,ypos,40,40);
        fill(#ccffff);
        text(8,xpos+12,ypos+35);
      }
      
     }
     if (show==-1){
        fill(0);
        rect(xpos+5,ypos+5,30,30);
     }
   }
   
  
  
  
}
