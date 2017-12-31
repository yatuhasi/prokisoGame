class Enemy extends Creature {
  float r = random(20)+10;
  Player p;
  color c = 200;

  Enemy(float x, float y, float vx, float vy) {
    super(x, y, random(vx), vy);
  }

  void update() {
    x += vx;
    if (x>width)vx=-vx;
    if (x<0)vx=-vx;
  }

  void disp() {
    fill(c);
    ellipse(x, y, r, r);
    //text("enemy", x, y);
    for (int i = 0; i < enemySize; i++) {
      //imageMode(CENTER);
      image(enemyGif[i], x, y, 2*r, 2*r);
    }
  }

  void collision(Player p) {
    if (((y+r)>p.y)&&((y-r)<(p.y+h))&&((x+r)>p.x)&&((x-r)<(p.x+w))) {
      c = #DE0707;
    }
  }
}