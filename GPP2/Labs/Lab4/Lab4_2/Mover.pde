class Mover {

  // The Mover tracks position, velocity, and acceleration 
  PVector position;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;
  float mass;
  float radius;
  public int[] colour = {255,255,255};
  
  public float m= 0;

  
  
  
  Mover(float radius, float x, float y, float vX, float vY) {
    // Start in the center
    position = new PVector(x,y);
    this.radius = radius;
    velocity = new PVector(vX,vY);
    acceleration = new PVector(0, 0);
    topspeed = 10;
    mass = radius;
    
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
    checkEdges();
    System.out.println(parseInt(m));
    //print(double.parseInt(time));
    
    if (m + 1000 < millis())
    {
     colour[1] = 255;
     colour[2] = 255;
    }
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(colour[0],colour[1],colour[2]);
    ellipse(position.x,position.y,radius *2,radius * 2);
  }
  


  
  void checkEdges()
  {
   if(position.x > (width - (radius/2)))
   {
    velocity.x *= -1;
   }
   else if(position.x < 0+(radius/2))
   {
    velocity.x *= -1;
   }
   
   if(position.y > (height - (radius/2)))
   {
    velocity.y *= -1;
   }
   else if(position.y < 0+(radius/2))
   {
    velocity.y *= -1;
   }
  }
  
  float getRadius()
  {
   return radius; 
  }
  
   double getX()
  {
   return position.x; 
  }
  
   double getY()
  {
   return position.y; 
  }
  
  double getMass()
  {
   return mass; 
  }
  void collisionCheck(Mover ball)
  {
   if (PVector.sub(ball.position, this.position).mag() < (ball.radius + this.radius))
   {
      colliding(ball); 

      this.colour[1] = 0;
      this.colour[2] = 0;
      
      ball.colour[1] = 0;
      ball.colour[2] = 0;
      
      this.m = millis();
      ball.m = millis();
   }
  }
   void colliding(Mover ball)
  {
    PVector v1;
    PVector v2;
    PVector u1 = this.velocity;
    PVector u2 = ball.velocity;
    float m1 = this.radius;
    float m2 = ball.radius;
    
    v1 = PVector.div(PVector.add(PVector.mult(u1, (m1-m2)) , (PVector.mult(u2, 2*m2))) , (m1 + m2));
    
    v2 = PVector.div(PVector.add(PVector.mult(u2,(m2-m1)) , (PVector.mult(u1, 2*m1))), (m1 + m2));
    
    
    this.velocity = v1;
    ball.velocity = v2;
  }
}