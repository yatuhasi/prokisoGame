class Player extends Creature {
  float v0y = 10;
  boolean jflag = false;
  int jtime = 0;

  Player(float x, float y, float vx, float vy) {
    super(x, y, vx, vy);
  }

  public void walk(boolean l, boolean r) {
    if (l==true) {
      x -= vx;
    }
    if (r==true) {
      x += vx;
    }
  }

  void jamp(boolean j) {
    text("y:"+y, 10, 50);//デバッグ用
    text("ms:"+millis(), 10, 66);//デバッグ用
    if ((j == true)&&(jflag == false)) {
      vy = v0y;
      jflag = true;
      jtime = millis();
    }

    int f;
    f = (int)frameRate;

    if (((millis()-jtime)/1000 >= ((v0y/gravity)/f))&&(vy == 0)) {//経過時間が放物線の頂点を越えた時かつ垂直速度が0のとき
      jflag = false;
    }
    
  }
}