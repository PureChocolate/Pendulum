class Pendulum {
  PVector origin;
  PVector bob;
  float r;
  float angle = PI/4;
  float g = 1.4;
  float m = .5;
  float aVel = 0.0;
  float aAcc = 0.0;
  float damping = .988;
  float period = TWO_PI * sqrt(r/g);
  boolean dragging = false;


  Pendulum(PVector origin_, float r_) {
    origin = origin_;
    bob = new PVector();
    r = r_;
  }


  void go() {
    update();
    drag(mouseX, mouseY);
    display();
    println("PE = " + pEGet());
    println("KE = " + keGet());
    println("Velocity = ");
    print("X = " + bob.x);
    println("y = " + bob.y);
  }

  void update() {
    background(255);
    if (!dragging) {
      aAcc = -(g / r) * sin(angle);
      aVel += aAcc;    
      aVel *= damping;
      angle += aVel;
    }
  }

  int getX() {
    return (int)bob.x;
  }
  int getY() {
    return (int)bob.y;
  }

  double pEGet() {
    return (double)(m * g * (height - bob.y));
  }

  double keGet() {
    return (double)(0.5 * (m * (aVel * aVel)));
  }

  double getPeriod() {
    return (double)(TWO_PI * (Math.sqrt(r/g)));
  }
  void display() { 
    bob.x = origin.x + r * sin(angle);
    bob.y = origin.y + r * cos(angle);

    stroke(0);

    line(origin.x, origin.y, bob.x, bob.y);

    fill(175);
    if (dragging) {
      fill(0);
    }

    circle(bob.x, bob.y, 32);
  }

  void click(float mx, float my) {
    float d = dist(mx, my, bob.x, bob.y);
    if (d < 32) {
      dragging = true;
    }
  }

  void stopDrag() {
    aVel = 0;
    dragging = false;
  }

  void drag(float mx, float my) {
    if (dragging) {
      PVector diff = PVector.sub(origin, new PVector(mx, my));
      angle = atan2(-1*diff.y, diff.x) - radians(90);
    }
  }
}
