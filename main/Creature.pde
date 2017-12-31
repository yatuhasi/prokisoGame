class  Creature {
  float x, y, vx, vy;
  float w=40, h=100;

  Creature(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
  }

  void gravity() { //加速度ayでの落下
    y -= vy;
    vy -= gravity;
  }

  void disp() {
    rectMode(CORNER);
    //rect(x, y, w, h);
    image(playerGif, x, y, w, h); //要改善
  }
}