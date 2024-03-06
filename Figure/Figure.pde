float weirdoX; // weirdoX for horizontal position
float weirdoY; // weirdoY for vertical position
float weirdoSpeedX = 3; // Horizontal speed
float weirdoSpeedY = -3; // Vertical speed
boolean isMoving = true;
int[] sunSizes = new int[10]; // Array to hold sizes of sun circles

void setup() {
  size(400, 400);
  weirdoX = width / 2;
  weirdoY = height + 80;
  smooth();
  initializeSunSizes();
}

void draw() {
  background(135, 206, 235);
  drawWeirdo();
  animateAndDrawSun();
  stroke(1);
  if (isMoving) {
    updatePosition();
  }
}

void initializeSunSizes() {
  for (int i = 0; i < sunSizes.length; i++) {
    sunSizes[i] = 30;
  }
}

void drawWeirdo() {
  drawBody();
  drawEars();
  drawHead();
  drawEyes();
  drawPupils();
  drawStomach();
  drawLegs();
  drawMouth();
}

color randomColor() {
  return color(random(255), random(255), random(255));
}

void drawBody() {
  fill(144, 238, 144);
  ellipse(weirdoX, weirdoY - 150, 150, 100);
}

void drawEars() {
  fill(0, 115, 13);
  ellipse(weirdoX - 30, weirdoY - 250, 30, 45);
  ellipse(weirdoX + 30, weirdoY - 250, 30, 45);
}

void drawHead() {
  fill(144, 238, 144);
  ellipse(weirdoX, weirdoY - 220, 100, 90);
}

void drawEyes() {
  fill(randomColor());
  ellipse(weirdoX - 20, weirdoY - 230, 30, 20);
  ellipse(weirdoX + 20, weirdoY - 230, 30, 20);
}

void drawPupils() {
  fill(randomColor());
  ellipse(weirdoX - 20, weirdoY - 230, 10, 10);
  ellipse(weirdoX + 20, weirdoY - 230, 10, 10);
}

void drawStomach() {
  fill(randomColor());
  ellipse(weirdoX, weirdoY - 130, 60, 60);
}

void drawLegs() {
  fill(randomColor());
  ellipse(weirdoX - 40, weirdoY - 100, 40, 30);
  ellipse(weirdoX + 40, weirdoY - 100, 40, 30);
}

void drawMouth() {
  stroke(0, 67, 13);
  fill(0, 67, 13);
  rect(weirdoX - 15, weirdoY - 210, 30, 10);
  ellipse(weirdoX - 15, weirdoY - 205, 10, 10);
  ellipse(weirdoX + 15, weirdoY - 205, 10, 10);
}

void updatePosition() {
  if (isMoving) {

    if (weirdoX <= 0 || weirdoX >= width) {
      weirdoSpeedX = -weirdoSpeedX; 
    }
    weirdoX += weirdoSpeedX;


    weirdoY += weirdoSpeedY;


    if (weirdoY <= 0 || weirdoY >= height) {
      weirdoSpeedY = -weirdoSpeedY;
    }
  }
}

void animateAndDrawSun() {
  for (int i = 0; i < sunSizes.length; i++) {
    fill(255, 204, 0);
    noStroke();
    ellipse(width - 50, 50, sunSizes[i], sunSizes[i]);
    // Update sun sizes for animation within the same loop for efficiency
    sunSizes[i] += (int)random(-2, 3);
    sunSizes[i] = constrain(sunSizes[i], 10, 100); // Adjusted range for a more subtle effect
    if (sunSizes[i]>=100) {
      sunSizes[i]-=sunSizes[i];
    }
  }
}

void keyPressed() {
  if (key == 'c') {
    isMoving = !isMoving;
  }
}
