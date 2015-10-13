/* @pjs preload="minion.png"; */
/* @pjs preload="banana.png"; */
PImage minion;
PImage bananabunch;
Snowflake [] dots;
int ellipseSize=10;
boolean countr = false;
int dotsDestroyed = 0;
void setup()
{

  size(800,800);
  frameRate(40);
  minion =loadImage("minion.png");
  bananabunch =loadImage("fire.png");
  background(0);
  noStroke();
  dots = new Snowflake[300];
  for(int i=0; i<dots.length; i++){
      dots[i] = new Snowflake();
  }

}
void draw()
{
  for(int i=0; i<dots.length; i++){
    
    
    dots[i].erase();
    
    dots[i].lookDown();
    dots[i].move();
    dots[i].wrap(); 
    dots[i].show();
    textSize(20);
        fill(0);
        rect(710,35,65,25);
        fill(255, 0,0 );
        text("Dots Destroyed: "+ dotsDestroyed, 550,50);
        
  }
  //reload();
  mouse();
}
void reload(){
    if(key=='r'){
      countr=true;
      fill(0);
      rect(0,0,width, height);
      println("reload");
      countr = false;
    }
    if(countr)
    println(countr);
  }
  
void mouse()
{   
    stroke(255,116,23);
    strokeWeight(8);
   //line(pmouseX, pmouseY, mouseX, mouseY);
   bananabunch.resize(30,30);
    //image(bananabunch, mouseX,mouseY);
    fill(0);
    ellipse(mouseX, mouseY, 40,40);
    stroke(0);
    ellipse(pmouseX, pmouseY, 42,42);
   noStroke();
}

class Snowflake
{
  //class member variable declarations
  int x, y;
  boolean isMoving;
  Snowflake()
  {
    //class member variable initializations
    x = (int)(Math.random()*width);
    y = (int)(Math.random()*height); 
    isMoving = true;
  }
  void show()
  {
    fill(255);
    ellipse(x,y,ellipseSize,ellipseSize);
    //bananabunch.resize(15,15);
    //image(bananabunch, x,y );
  }
  void lookDown()
  {
    if((y<height&&y>100)&&(get(x,y+8)!=color(0))){
      isMoving = false;
      if(isMoving == false){
        y=100;
        x=(int)(Math.random()*width);
        dotsDestroyed++;
      }
    }
    
    else {
      isMoving =true;
    }
  }
  void erase()
  {
    fill(0);
    ellipse(x,y,12,12);
  }
  void move()
  {
    if (isMoving == true){
      y++;
    }
  }
  void wrap()
  {
      if(y>height-9){
        y=100;
        x=(int)(Math.random()*width);
      }
  }
  
}

