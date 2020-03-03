void intro() {
  textAlign(CENTER);
  background(#FFCD03);
  textSize(50);
  fill(#FF0318);
  text("Slime Basketball", width/2, height/2-80);
  noStroke();
  pushMatrix();
  rectMode(CENTER);
  rect(width/2+200, height/2+100, 150, 100);
  textSize(20);
  fill(#0343FF);
  text("2 Player Mode", width/2+200, height/2+100);
  rect(width/2-200, height/2+100, 150, 100);
  fill(#FF0318);
  text("1 Player Mode", width/2-200, height/2+100);
  if (mouseX>width/2+125&&mouseX<width/2+275&&mouseY>height/2+50&&mouseY<height/2+150) {
    fill(#16FF03);
    rect(width/2+200, height/2+100, 150, 100);
    fill(#FF0318);
    text("2 Player Mode", width/2+200, height/2+100);
  }
  if (mouseX<width/2-125&&mouseX>width/2-275&&mouseY>height/2+50&&mouseY<height/2+150) {
    fill(#16FF03);
    rect(width/2-200, height/2+100, 150, 100);
    fill(#FF0318);
    text("1 Player Mode", width/2-200, height/2+100);
  }
  popMatrix();
}

void introClicks() {
  pushMatrix();
  rectMode(CENTER);
  if (mouseX>width/2+125&&mouseX<width/2+275&&mouseY>height/2+50&&mouseY<height/2+150) {
    mode=2;
    textAlign(CORNER);
  }
  if (mouseX<width/2-125&&mouseX>width/2-275&&mouseY>height/2+50&&mouseY<height/2+150) {
    mode=5; 
    textAlign(CORNER);
  }
  rectMode(CORNER);

  popMatrix();
}
