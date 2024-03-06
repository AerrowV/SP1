void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  // Body
  fill(144, 238, 144);
  ellipse(200, 250, 150, 100);

  // Ears
  fill(0, 115, 13);
  ellipse(170, 150, 30, 45);
  ellipse(230, 150, 30, 45);

  // Head
  fill(144, 238, 144);
  ellipse(200, 180, 100, 90);

  // Eyes
  fill(255);
  ellipse(180, 170, 30, 20);
  ellipse(220, 170, 30, 20);

  // Pupils
  fill(0);
  ellipse(180, 170, 10, 10);
  ellipse(220, 170, 10, 10);

  // Stomach
  fill(173, 255, 47);
  ellipse(200, 270, 60, 60);

  // Legs
  fill(144, 238, 144);
  ellipse(160, 300, 40, 30);
  ellipse(240, 300, 40, 30);

  // Mouth
  stroke(0,67,13);
  fill(0,67,13);
  rect(185, 190, 30, 10);
  ellipse(185, 195, 10, 10);
  ellipse(215, 195, 10, 10);
}
