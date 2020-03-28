int wallAmount = 5;
Wall[] walls = new Wall[wallAmount];
Player player;
float speed = 2;

void setup () {
  
  size(1000, 500);
  background(100);
  
  // Create player
  player = new Player(width/4, height/2, 0);
  
  // Generates random walls
  for(int i = 0; i < walls.length; i++) {
    walls[i] = new Wall(random(0, width/2), random(0, height), random(0, width/2), random(0, height));
  }
  
  // Generates one wall
  walls[0] = new Wall(450, 100, 450, 400);
  
}

void draw () {
  
  background(100);
  
  // Handle inputs
  inputs();
  
  // Render seperation line
  stroke(0);
  line(width/2, 0, width/2, height);
  
  // Render player
  player.Render();
  player.Raycast();
  
  // Render walls
  for (Wall w : walls) {
    w.Render();  
  }
}

void inputs() {
  if (keyPressed) {
    if (key == 'a') {
      player.Move(-1 * speed, 0);
    } 
    if (key == 'd') {
      player.Move(1 * speed, 0);  
    }
    if (key == 'w') {
      player.Move(0, -1 * speed);  
    }
    if (key == 's') {
      player.Move(0, 1 * speed);  
    }
  }  
}
