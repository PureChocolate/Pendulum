Pendulum p;
IntList valsX;
IntList valsY;
void setup() {
  background(255);
  smooth();  
  p = new Pendulum(new PVector(width/4, height/4), 200);
}

void settings() {
  size(1000, 800);
}

void draw() {
  int temp = (int)p.bob.x;
  p.go();
  noFill();
  if(300 + frameCount < width){
    line(300 + frameCount, p.bob.x, 300);
  }
}

void mousePressed() {
  p.click(mouseX, mouseY);
}

void mouseReleased() {
  p.stopDrag();
}
