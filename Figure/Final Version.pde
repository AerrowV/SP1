float weirdoX; // Horizontal position of "weirdo"
float weirdoY; // Vertical position of "weirdo"
float weirdoSpeedX = 3; // Horizontal speed of "weirdo"
float weirdoSpeedY = -3; // Vertical speed of "weirdo"
boolean isMoving = true; // Controls if "weirdo" is moving
int[] sunSizes = new int[10]; // Stores sizes for sun animation circles

void setup() {
  size(400, 400); // Set the canvas size
  weirdoX = width / 2; // Initialize "weirdo" at the horizontal center
  weirdoY = height + 80; // Start y-axis for "weirdo"
  smooth();
  initializeSunSizes(); // Initialize the sizes of the sun's circles
}

void draw() {
  background(135, 206, 235); // Set the sky color
  stroke(1); // Outline on "weirdo"
  drawWeirdo(); // Draw "weirdo" character
  animateAndDrawSun(); // Animate and draw the sun
  if (isMoving) { // If "weirdo" is allowed to move
    updatePosition(); // Update "weirdo's" position based on speed and direction
  }
}

// Initializes the sunSizes array with initial values
void initializeSunSizes() {
  for (int i = 0; i < sunSizes.length; i++) {
    sunSizes[i] = 30; // Set initial size for each sun circle
  }
}

// Draws the "weirdo" character by calling individual component drawing functions
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

// Generates and returns a random color
color randomColor() {
  return color(random(255), random(255), random(255));
}

// Draws "weirdo's" body
void drawBody() {
  fill(144, 238, 144);
  ellipse(weirdoX, weirdoY - 150, 150, 100);
}

// Draws "weirdo's" ears
void drawEars() {
  fill(0, 115, 13);
  ellipse(weirdoX - 30, weirdoY - 250, 30, 45);
  ellipse(weirdoX + 30, weirdoY - 250, 30, 45);
}

// Draws "weirdo's" head
void drawHead() {
  fill(144, 238, 144);
  ellipse(weirdoX, weirdoY - 220, 100, 90);
}

// Draws "weirdo's" eyes
void drawEyes() {
  fill(randomColor());
  ellipse(weirdoX - 20, weirdoY - 230, 30, 20);
  ellipse(weirdoX + 20, weirdoY - 230, 30, 20);
}

// Draws "weirdo's" pupils
void drawPupils() {
  fill(randomColor());
  ellipse(weirdoX - 20, weirdoY - 230, 10, 10);
  ellipse(weirdoX + 20, weirdoY - 230, 10, 10);
}

// Draws "weirdo's" stomach
void drawStomach() {
  fill(randomColor());
  ellipse(weirdoX, weirdoY - 130, 60, 60);
}

// Draws "weirdo's" legs
void drawLegs() {
  fill(randomColor());
  ellipse(weirdoX - 40, weirdoY - 100, 40, 30);
  ellipse(weirdoX + 40, weirdoY - 100, 40, 30);
}

// Draws "weirdo's" mouth
void drawMouth() {
  stroke(0, 67, 13);
  fill(0, 67, 13);
  rect(weirdoX - 15, weirdoY - 210, 30, 10);
  ellipse(weirdoX - 15, weirdoY - 205, 10, 10);
  ellipse(weirdoX + 15, weirdoY - 205, 10, 10);
}

// Updates "weirdo's" position
void updatePosition() {
  if (isMoving) {
   weirdoX += weirdoSpeedX;
    weirdoY += weirdoSpeedY;
    if (weirdoX <= 0 || weirdoX >= width) weirdoSpeedX = -weirdoSpeedX; // Reverse horizontal direction at edges
    if (weirdoY <= 0 || weirdoY >= height) weirdoSpeedY = -weirdoSpeedY; // Reverse vertical direction at edges
  }
}

// Animates and draws the sun by updating and drawing circles in the sunSizes array
void animateAndDrawSun() {
  for (int i = 0; i < sunSizes.length; i++) {
    fill(255, 204, 0); // Set sun color
    noStroke(); // No outline for the sun circles
    ellipse(width - 50, 50, sunSizes[i], sunSizes[i]); // Draw sun circle
    sunSizes[i] += (int)random(-2, 3); // Animate size for pulsating effect
    sunSizes[i] = constrain(sunSizes[i], 10, 100); // Keep circle size within bounds
      if (sunSizes[i] >= 100){
        sunSizes[i] -= sunSizes[i];
      }
    }
  }


// Toggles "weirdo's" movement when the 'x' key is pressed
void keyPressed() {
  if (key == 'x') {
    isMoving = !isMoving; // Toggle movement
  }
}
