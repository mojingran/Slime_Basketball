void AI2(){
  
  
   scoretimer--;
   timer--;

  if (timer<0) {

    background(sunset);
    fill(0);
    text(floor(scoretimer/60),width/2-50,100);
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
      AI2player.setPosition(600, 400);
      ball.setPosition(random(530, 590), 200);
      ball.setVelocity(0, 0);
      ball.setAngularVelocity(0);
      AI2player.setAngularVelocity(0);
      lplayer.setAngularVelocity(0);
      lplayer.setVelocity(0, 0);
      AI2player.setVelocity(0, 0);
    }
    if (ball.getX()>690&&ball.getX()<760&&ball.getY()>=320&&ball.getY()<330&&ball.getVelocityY()>0) {
      lscore++; 
      timer=60;
      lplayer.setPosition(200, 400);
      AI2player.setPosition(600, 400);
      lplayer.setVelocity(0, 0);
      AI2player.setVelocity(0, 0);
      ball.setPosition(lplayer.getX(), 200);
      ball.setVelocity(0, 0);
      ball.setAngularVelocity(0);
      //  AI2player.setAngularVelocity(0);
      lplayer.setAngularVelocity(0);
    }
    ArrayList<FContact> contacts2=AI2player.getContacts();
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
          //  AI2player.setPosition(600, 400);
          // AI2player.setVelocity(0, 0);
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
          //   AI2player.setPosition(600, 400);
          //   AI2player.setVelocity(0, 0);
          //  ball.setPosition(AI2player.getX(), 200);
        }
      }

      k++;
    }
    ArrayList<FContact> contacts4=AI2player.getContacts();
    int m=0;
    while (m<contacts4.size()) {
      FContact c=contacts4.get(m);
      if (c.contains(rground)||c.contains(lground)) AICanJump=true;

      m++;
    }
    // if(lplayer.getX()>=375) lplayer.setPosition(375,lplayer.getY());

    //if(AI2player.getX()<=425) AI2player.setPosition(425,AI2player.getY());

    if (wkey&&leftCanJump) lplayer.addImpulse(0, -2500);

    if (akey) lplayer.addImpulse(-300, 0);

    if (dkey) lplayer.addImpulse(300, 0);

    // if (leftkey) AI2player.addImpulse(-300, 0);

    //    if (rightkey) AI2player.addImpulse(300, 0);
    if(AI2player.getX()<600&&abs(lplayer.getX()-AI2player.getX())>200){
     AI2player.addImpulse(floor(lplayer.getX()-AI2player.getX())*2, 0);
   }
   if(AI2player.getX()>200&&abs(lplayer.getX()-AI2player.getX())>200){
     AI2player.addImpulse(floor(lplayer.getX()-AI2player.getX())*2, 0);
   }
    worldAI2.step();

    worldAI2.draw();
    textAlign(CENTER);
    textSize(30);
    fill(#FC0505);
    text("CPU", AI2player.getX(), AI2player.getY());
    textAlign(CORNER);
    fill(255);
    textSize(50);
    if (ball.getX()>200) {
      CPUact();
    }
  }

  text("LEFT:"+lscore, 100, 100);

  text("RIGHT:"+rscore, 500, 100);

  
  if (scoretimer<0) {
    textAlign(CENTER);
    if(lscore>=1) {text("PLAYER WINS", width/2, 300);}
    else{text("BETTER LUCK NEXT TIME",width/2,300);}
    rectMode(CENTER);
    fill(red);
    rect(200, 480, 300, 100);
    fill(255);
    text("RESTART", 200, 500);
    fill(red);
    rect(600,480,300,100);
    fill(255);
    text("MAIN MENU",600,500);
    if (mouseX>50&&mouseX<350&&mouseY>430&&mouseY<530) {
      fill(255);
      rect(200, 480, 300, 100);
      fill(red);
      text("RESTART", 200, 500);
      fill(255);
      if (mousePressed) {
        lscore=0;
        rscore=0;
        timer=60;
        setup();
      }
    }
    if(mouseX>450&&mouseX<750&&mouseY>430&&mouseY<530){
      fill(255);
      rect(600,480,300,100);
      fill(red);
      text("MAIN MENU",600,500);
      fill(255);
      if (mousePressed) {
        lscore=0;
        rscore=0;
        timer=60;
        mode=1;
      }
    }
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

void AI2Clicks(){
  
}
