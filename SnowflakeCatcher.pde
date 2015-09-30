Snowflake [] dots;
void setup()
{

  size(800,800);
  frameRate(40);
  background(0);
  dots = new Snowflake[100];
  for(int i=0; i<dots.length; i++){
      dots[i] = new Snowflake(false);
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
    if(isMoving==true){

    }
  }
}
void mouseDragged()
{
  if(mousePressed == true){
    fill(155);
    noStroke();
    ellipse(mouseX, mouseY, 10,10);
  }
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
    ellipse(x,y,5,5);
  }
  void lookDown()
  {
    if((y<height&&y>0)&&(get(x,y+8)!=0)){
      isMoving = false;
    }
    else {
      isMoving =true;
    }
  }
  void erase()
  {
    fill(0);
    ellipse(x,y,7,7);
  }
  void move()
  {
    if (isMoving == true){
      y++;
    }
  }
  void wrap()
  {
      if(y>height){
        y=0;
        x=(int)(Math.random()*width);
      }
  }
}


