void AISelector() {
  background(#FFCD03);
  //skillful
  imageMode(CENTER);
  textAlign(CENTER);
  textSize(50);
  text("Choose your opponent", width/2, height/2-200);
  textSize(20);
  image(skillfulball, width/2-200, height/2+100);
  image(angryball, width/2+200, height/2+100);
  if (dist(mouseX, mouseY, width/2-200, height/2+100)<150) {
    image(sb2, width/2-200, height/2+100);
    textSize(50);
    fill(red);
    text("MODERATE",width/2,height/2-130);
    textSize(20);
    fill(0);
    text("Objective: Score 3 goals before he does", width/2, height/2-100);
  }
  if (dist(mouseX, mouseY, width/2+200, height/2+100)<150) {
    image(ab2, width/2+200, height/2+100);
    textSize(50);
    fill(red);
    text("HARD",width/2,height/2-130);
    textSize(20);
    fill(0);
    text("HE'S MAD! Objective: Score 2 goals within 90 seconds", width/2, height/2-100);
  }
  fill(0);
  textAlign(CORNER);
  
  //angry: have to score 3 goals within 2 minutes
}

void AISelectorClicks() {
  if (dist(mouseX, mouseY, width/2-200, height/2+100)<150) {
    mode=AI;
  }
  if (dist(mouseX, mouseY, width/2+200, height/2+100)<150) {
    mode=AI2;
  }
}
