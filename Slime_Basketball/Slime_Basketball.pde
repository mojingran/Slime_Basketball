import fisica.*;

FWorld world,worldAI;

final int intro=1,game=2,gameover=3,AI=4;
int mode=1;
boolean leftCanJump, rightCanJump;

boolean wkey, akey, dkey,upkey,leftkey,rightkey;

FCircle lplayer, rplayer, ball;

color blue   = color(29, 178, 242);

color brown  = color(166,120,24);

color green  = color(74,163,57);

color red    = color(224, 80, 61);

color yellow = color(242, 215, 16);

int lscore,rscore,timer;

FBox lground, rground, lwall, rwall,ceiling,lbackboard,rbackboard,lrim,rrim;

PImage sunset,eightball,water;

void setup() {
 textAlign(CENTER);
  Fisica.init(this);

  world = new FWorld();
  worldAI=new FWorld();
  world.setGravity(0, 980);
  worldAI.setGravity(0,980);
  sunset=loadImage("sunset.jpg");

  eightball= loadImage("eightball.png");

  water=loadImage("water.jpg");

  sunset.resize(800,600);

  eightball.resize(70,70);

  water.resize(400,100);

  size(800, 600);

  timer=0;

  lground= new FBox(400, 100);

  lground.setNoStroke();

  lground.setPosition(200, 575);

  lground.setStatic(true);

  

  world.add(lground);
  worldAI.add(lground);


  rground = new FBox(400, 100);

  rground.setNoStroke();

  rground.setPosition(600, 575);

  rground.setStatic(true);

  

  world.add(rground);
worldAI.add(rground);




  lplayer= new FCircle(70);

  lplayer.setNoStroke();
  lplayer.setRotatable(false);
  lplayer.setPosition(200, 400);
  lplayer.setRotatable(false);
  lplayer.setFill(0);

  world.add(lplayer);
worldAI.add(lplayer);
  rplayer= new FCircle(70);
  
  rplayer.setNoStroke();
  rplayer.setRotatable(false);
  rplayer.setPosition(600, 400);
  rplayer.setFill(255);
  rplayer.setRotatable(false);
  world.add(rplayer);

  lwall= new FBox(50, 1200);

  lwall.setStatic(true);

  lwall.setFill(0);

  lwall.setPosition(-25, 0);

  world.add(lwall);
   worldAI.add(lwall);

  rwall= new FBox(50, 1200);

  rwall.setStatic(true);

  rwall.setFill(0);

  rwall.setPosition(825, 0);

  world.add(rwall);
worldAI.add(rwall);
  

  ball=new FCircle(30);

  ball.setFillColor(blue);

  ball.setRestitution(1);

  ball.setPosition(lplayer.getX(),100);


  world.add(ball);
 worldAI.add(ball);
  ceiling= new FBox(800,100);

  ceiling.setPosition(400,-50);

  ceiling.setStatic(true);

  world.add(ceiling);
worldAI.add(ceiling);

lbackboard=new FBox(10,100);
lbackboard.setFill(255);
lbackboard.setStatic(true);
lbackboard.setPosition(40,300);
lbackboard.setNoStroke();
world.add(lbackboard);
worldAI.add(lbackboard);

rbackboard=new FBox(10,100);
rbackboard.setFill(255);
rbackboard.setStatic(true);
rbackboard.setPosition(760,300);
rbackboard.setNoStroke();
world.add(rbackboard);
worldAI.add(rbackboard);

lrim=new FBox(10,4);
lrim.setFillColor(#DE7F02);
lrim.setStatic(true);
lrim.setNoStroke();
lrim.setPosition(115,323);
world.add(lrim);
worldAI.add(lrim);

rrim=new FBox(10,4);
rrim.setFillColor(#DE7F02);
rrim.setStatic(true);
rrim.setNoStroke();
rrim.setPosition(686,323);
world.add(rrim);
worldAI.add(rrim);
}



void draw() {
  if(mode==1){
  intro();
  }else if(mode==2){
   game();
  }else if(mode==3){
   gameover(); 
  }else if(mode==4){
   AI(); 
  }
  else{
   error(); 
  }


}

void mouseClicked(){
 if(mode==1){
  introClicks(); 
 }else if(mode==2){
  gameClicks(); 
 }else if(mode==3){
  gameOverClicks(); 
 }else if(mode==4){
  AIClicks(); 
 }
  
}


void keyPressed() {

  if (key=='w'||key=='W') wkey=true;

  if (key=='a'||key=='A') akey=true;

  if (key=='d'||key=='D') dkey=true;

  if(keyCode==UP) upkey=true;

  if(keyCode==LEFT) leftkey=true;

  if(keyCode==RIGHT) rightkey=true;

}



void keyReleased() {

  if (key=='w'||key=='W') wkey=false;

  if (key=='a'||key=='A') akey=false;

  if (key=='d'||key=='D') dkey=false;

  if(keyCode==UP) upkey=false;

  if(keyCode==LEFT) leftkey=false;

  if(keyCode==RIGHT) rightkey=false;

}
