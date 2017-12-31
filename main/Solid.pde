class Solid {

  float x, y, w, h;
  Player p;

  Solid(float x, float y, float w, float h, Player p) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h; 
    this.p = p;
  }

  void disp() {
    fill(255);
    rect(x, y, w, h);
  }

  void collision() {
    if (((p.y + p.h) > y)&&(p.x < (x+w))&&(p.x > x)&&((p.y + p.h) < (y + h))) {  //枠上∧枠内左∧枠内右∧枠下
      if (p.vy < 0) {
        p.y = y - p.h;
        p.vy = 0;
        p.jflag = false;
      }
    }
  }
}