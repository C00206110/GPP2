PVector one;
PVector two;

void setup() 
{
  one = null;
  two = null;
  
  size(1000, 1000);
  stroke(20);
  background(255);
}

void draw() 
{
  //print (mouseX, mouseY);
  if(two != null)
  {
    line(one.x , one.y , two.x , two.y);
  }
}

void mousePressed()
{  
  if (one == null )
    {
      one = new PVector(mouseX, mouseY);
      
    }
    else if(two == null && one != null)
    {
      two = new PVector(mouseX, mouseY); 
    }   
  }