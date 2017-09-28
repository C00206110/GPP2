import java.util.Random;
Mover[] movers = new Mover[10];
Random rn = new Random();

void setup() 
{
  size(800,600);
  randomSeed(1);
  for (int i = 0; i < movers.length; i++) 
  {
       movers[i] = new Mover(random(10, 30), random(0 + 30, width - 30), random(0 + 30, height - 30), random(-3,3), random(-3,3));
  }
  

}

void draw() {
  
  background(255);

   for (int i = 0; i < movers.length; i++)
   {
     movers[i].update();
     for (int j = i +1; j < movers.length; j++)
     {
       movers[i].collisionCheck(movers[j]);
     }
     movers[i].display();
   }
  
  
}


  