class Ammo {
  float x, y, r=10, ref_x, ref_y;
  float v0, power=0.05;
  float theta = 45 ;
  float vx, vy;

  Ammo(float x, float y, float ref_x, float ref_y) {
    this.x = x;
    this.y = y;
    this.ref_x = ref_x;
    this.ref_y = ref_y;
    v0 = dist(x, y, ref_x, ref_y)*power;
    theta = atan2(y-ref_y, ref_x-x);
    vx =  v0*cos(theta);
    vy = -v0*sin(theta);
  }

  void update() {
    x += vx;
    y += vy;
    vy += gravity;
  }

  void disp() {
    fill(255);
    ellipse(x, y, r, r);
  }  

  void hitCheck(Creature jack) {
    if (dist(jack.x, jack.y, x, y) < r) {
    }
  }
}