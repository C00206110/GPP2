import java.util.Random;
PVector mouse = new PVector(mouseX , mouseY);
PVector circlePos;
Random rn = new Random();

float xspeed = 3;
float yspeed = 3;
float ballXPos;
float ballYPos;

void setup() {
  size(1000, 1000);
  smooth();
  circlePos = new PVector (50,50);
}

void draw() {
  background(255);

  xspeed = rn.nextInt(35) +1;
  yspeed = rn.nextInt(35) +1;
  

  if(mouseX > circlePos.x)
  {
    //xspeed *= 1;
    circlePos.x = (circlePos.x + xspeed);
  }
  else
  {
    circlePos.x = (circlePos.x - xspeed);
  }
  
  
  if(mouseY > circlePos.y)
  {
    //yspeed *= 1;
    circlePos.y = (circlePos.y + yspeed) ;
  }
  else
  {
    //yspeed *= 1;
    circlePos.y = (circlePos.y - yspeed) ;
  }
  // Display circle at x,y position
  strokeWeight(2);
  fill(127);
  ellipse(circlePos.x, circlePos.y, 48, 48);
}