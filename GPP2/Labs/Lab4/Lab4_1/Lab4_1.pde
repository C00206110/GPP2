import java.util.Random;
Mover[] movers = new Mover[1];
Random rn = new Random();

void setup() 
{
  size(800,600);
  randomSeed(1);
  for (int i = 0; i < movers.length; i++) 
  {
       movers[i] = new Mover(random(1, 4), random(width), 0);

  }
}

void draw() {
  
  background(255);

   for (int i = 0; i < movers.length; i++)
   {

    PVector wind = new PVector(0.1, 0);
    PVector gravity = new PVector(0, 0.1*movers[i].mass);

    float c = 0.05;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1); 
    friction.normalize();
    friction.mult(c);

    //movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}


class Mover {

  // The Mover tracks position, velocity, and acceleration 
  PVector position;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;
  float mass;

  Mover(float m, float x, float y) {
    // Start in the center
    position = new PVector(x,y);
    mass =m;
    velocity = new PVector(0,0);
    acceleration = new PVector(0, 0);
    topspeed = 10;
  }
  
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }


  void update() {
    
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
    acceleration.mult(0);

    
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127,200);
    ellipse(position.x,position.y,48,48);
  }
  
  void checkEdges()
  {
   if(position.x > width )
   {
    position.x =width;
    velocity.x *= -1;
   }
   else if(position.x < 24)
   {
    velocity.x *= -1;;
    position.x =0;
   }
   
   if(position.y > (height))
   {
    velocity.y *= -1;
    position.y = height;
    //velocity.add(-10,-10);
   }
  }
   
}
  