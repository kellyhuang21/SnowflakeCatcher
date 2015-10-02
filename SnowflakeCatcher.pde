Snowflake [] dots;
int ellipseSize=10;
void setup()
{

  size(800,800);
  frameRate(40);
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
}
void mouseDragged()
{   
    stroke(255,116,23);
    strokeWeight(5);
   line(pmouseX, pmouseY, mouseX, mouseY);
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
  }
  void lookDown()
  {
    if((y<height&&y>0)&&(get(x,y+8)!=color(0))){
      isMoving = false;
    }
    else {
      isMoving =true;
    }
  }
  void erase()
  {
    fill(0);
    ellipse(x,y,ellipseSize+2,ellipseSize+2);
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


