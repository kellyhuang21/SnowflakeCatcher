/* @pjs preload="minion.png"; */
/* @pjs preload="banana.png"; */
PImage minion;
PImage bananabunch;
Snowflake [] dots;
int ellipseSize=10;
int fade =0;
boolean countr = false;
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
  }
  fade++;
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
    stroke(255,116,23,fade);
    strokeWeight(5);
   //line(pmouseX, pmouseY, mouseX, mouseY);
   bananabunch.resize(30,30);
    image(bananabunch, mouseX,mouseY);
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
    if((y<height&&y>0)&&(get(x,y+8)!=color(0))){
      isMoving = false;
      if(isMoving == false){
        y=0;
        x=(int)(Math.random()*width);
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
        y=0;
        x=(int)(Math.random()*width);
      }
  }
  
}


