import gifAnimation.*;

Gif playerGif;
float gravity = 0.5; //加速度の設定

Player player;
Solid gnd, gnd2;
Ammo ammo;
boolean aFlag = false;

int enemySize = 5;
Gif enemyGif[] = new Gif[enemySize];
Enemy[] enemy=new Enemy[enemySize];

void setup() {
  textSize(16);//デバッグ用
  frameRate(60);

  /*プレイヤの生成*/
  player = new Player(100, 200, 8, 0);  //プレイヤーの初期x座標，初期y座標，初期x速度，初期y速度
  playerGif = new Gif(this, "cat.gif");
  playerGif.play();

  /*エネミーの生成*/
  for (int i = 0; i < enemySize; i++) {
    enemy[i] = new Enemy(random(width), height*0.6+random(100), -6, 0);
    enemyGif[i] = new Gif(this, "bird.gif");
    enemyGif[i].play();
  }

  /*地面の生成*/
  gnd = new Solid(0, height*0.8, width, 20, player);
  gnd2 = new Solid(0, height*0.7, 200, 20, player);

  size(800, 600);
  colorMode(HSB);
}

void draw() {
  background(100, 200, 80);//背景色の設定

  player.walk(left, right);
  player.jamp(space);
  player.gravity();
  player.disp();

  enemy();

  gnd.disp();
  gnd.collision();
  gnd2.disp();
  gnd2.collision();

  /*弾の生成*/
  if ((mouseL==true)&&(aFlag==false)) {  
    ammo = new Ammo(player.x, player.y, (float)mouseX, (float)mouseY);
    aFlag =true ;
  }
  if (aFlag==true) {
    ammo.update();
    ammo.disp();
    if (ammo.y > height)aFlag = false;
  }
}

void enemy() {

  for (int i=0; i<enemySize; i++) {
    enemy[i].disp();
    enemy[i].update();
    enemy[i].collision(player);
  }
}

boolean right, left, down, up, mouseL, space;

void keyPressed() {//何のキーが押されたかを判定
  if (key =='d') right = true;
  if (key =='a')  left  = true;
  if (key =='s')  down  = true;
  if (key =='w')    up    = true;
  if (key ==' ')   space    = true;
}

void keyReleased() {
  if (key =='d') right = false;
  if (key =='a')  left  = false;
  if (key =='s')  down  = false;
  if (key =='w')    up    = false;
  if (key ==' ')   space    = false;
}

void mousePressed() {
  if (mouseButton == LEFT) mouseL = true;
}

void mouseReleased() {
  if (mouseButton == LEFT) mouseL =false;
}