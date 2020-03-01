void AI(){
  timer--;
  
  
  if (timer<0) {

    background(sunset);
    fill(#DE7F02);
    rect(40, 320, 80, 5);
    rect(680, 320, 80, 5);
    fill(255);

    textSize(50);



    leftCanJump=false;

    rightCanJump=false;
    AICanJump=false;
    lplayer.getContacts();

    ArrayList<FContact> contacts=lplayer.getContacts();



    int i=0;

    while (i<contacts.size()) {

      FContact c=contacts.get(i);

      if (c.contains(lground)||c.contains(rground)) leftCanJump=true;

      i++;
    }

    //scoring
   if (ball.getX()>40&&ball.getX()<110&&ball.getY()>=320&&ball.getY()<330&&ball.getVelocityY()>0) {
      rscore++; 
      timer=60;
      lplayer.setPosition(200, 400);
      AIplayer.setPosition(600, 400);
      ball.setPosition(random(530,590), 200);
      ball.setVelocity(0, 0);
      ball.setAngularVelocity(0);
      AIplayer.setAngularVelocity(0);
      lplayer.setAngularVelocity(0);
      lplayer.setVelocity(0, 0);
      AIplayer.setVelocity(0, 0);
    }
    if (ball.getX()>690&&ball.getX()<760&&ball.getY()>=320&&ball.getY()<330&&ball.getVelocityY()>0) {
      lscore++; 
      timer=60;
      lplayer.setPosition(200, 400);
      AIplayer.setPosition(600, 400);
      lplayer.setVelocity(0, 0);
      AIplayer.setVelocity(0, 0);
      ball.setPosition(lplayer.getX(), 200);
      ball.setVelocity(0, 0);
      ball.setAngularVelocity(0);
    //  AIplayer.setAngularVelocity(0);
      lplayer.setAngularVelocity(0);
    }
    ArrayList<FContact> contacts2=AIplayer.getContacts();
    int j=0;

    while (j<contacts2.size()) {

      FContact c=contacts2.get(j);

      if (c.contains(rground)||c.contains(lground)) rightCanJump=true;

      j++;
    }

    ArrayList<FContact> contacts3=ball.getContacts();

    int k=0;

    while (k<contacts3.size()) {

      FContact c=contacts3.get(k);

      if (c.contains(rground)) {
        if (timer>=0) {
          lplayer.setPosition(200, 400);
          lplayer.setVelocity(0, 0);
        //  AIplayer.setPosition(600, 400);
         // AIplayer.setVelocity(0, 0);
          ball.setPosition(lplayer.getX(), 200);
        }
      }

      if (c.contains(lground)) {
        // rscore++;
        //  ball.setVelocity(0,0);
        //  timer=60;
        if (timer>=0) {
          lplayer.setPosition(200, 400);
          lplayer.setVelocity(0, 0);
       //   AIplayer.setPosition(600, 400);
       //   AIplayer.setVelocity(0, 0);
        //  ball.setPosition(AIplayer.getX(), 200);
        }
      }

      k++;
    }
    ArrayList<FContact> contacts4=AIplayer.getContacts();
    int m=0;
    while(m<contacts4.size()){
     FContact c=contacts4.get(m);
     if (c.contains(rground)||c.contains(lground)) AICanJump=true;

      m++;
     
    }
    // if(lplayer.getX()>=375) lplayer.setPosition(375,lplayer.getY());

    //if(AIplayer.getX()<=425) AIplayer.setPosition(425,AIplayer.getY());

    if (wkey&&leftCanJump) lplayer.addImpulse(0, -2500);

    if (upkey&&rightCanJump) AIplayer.addImpulse(0, -2500);

    if (akey) lplayer.addImpulse(-300, 0);

    if (dkey) lplayer.addImpulse(300, 0);

   // if (leftkey) AIplayer.addImpulse(-300, 0);

//    if (rightkey) AIplayer.addImpulse(300, 0);

    worldAI.step();

    worldAI.draw();
    textAlign(CENTER);
    textSize(30);
    fill(#FC0505);
    text("CPU",AIplayer.getX(),AIplayer.getY());
    textAlign(CORNER);
    fill(255);
    textSize(50);
    if(ball.getX()>200){
     CPUact(); 
    }
  }

  text("LEFT:"+lscore, 100, 100);

  text("RIGHT:"+rscore, 500, 100);

  if (lscore==3) {

    text("LEFT WINS", 250, 300);

    timer=100;

    timer++;

    text("Click anywhere to restart", 250, 500);

    /*if (mousePressed) {
      lscore=0;
      rscore=0;
      timer=60;
    }*/
  }

  if (rscore==3) {
    textAlign(CENTER);
     text("AI WINS", width/2, 300);
    rectMode(CENTER);
    fill(red);
    rect(250,480,300,100);
    fill(255);
    text("RESTART", 250, 500);
  textAlign(CORNER);
    rectMode(CORNER);
  /*  if (mousePressed) {
      lscore=0;
      rscore=0;
      timer=60;
    }*/

    timer=100;
    timer++;
  }
}

void AIClicks(){
  
}

void CPUact(){
  AIplayer.addImpulse(floor(ball.getX()-AIplayer.getX()),0);
  if(AIplayer.getY()-ball.getY()<130&&AIplayer.getY()-ball.getY()>40&&abs(ball.getX()-AIplayer.getX())<70&&AICanJump==true){
    AIplayer.addImpulse(0,-4000);
  }
}
