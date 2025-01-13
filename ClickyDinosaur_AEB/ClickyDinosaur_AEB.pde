// REMINDER! pull orgin BEFORE starting to work
// millis() function (use to increase difficulty as game continues)
//Returns the number of milliseconds (thousandths of a second) since starting the sketch. This information is often used for timing animation sequences.
//Clicky Dinosaur Capstone Final Project AEB
// draw dino later?
//ArrayList<cactus> enemies;
float groundY = 200;
float dGravity = 1;
float dinoSize = 50;
float dinoX = 65;
float dinoY = 300;
float dVelocity = 0;
float dinoJump = -10;
float gravity = 1;
boolean isDinoJumping = false; //determines if game continues (dino isn't jumping and hits obstacle, game over)
boolean gameOver = false;
int gameScore = 0;

void setup() {
    size(1280, 720);
    //enemies = new ArrayList<cactus>();
}

void draw() {
    background(154, 206, 235);
    //ground color bellow (make sure to change later)
    line(0, 350, width, 350);
      //temp dino
    fill(255, 255, 255);
    rect(dinoX, dinoY, dinoSize, dinoSize);
    dVelocity += gravity;
    dinoY += dVelocity;
    if (dinoY >= 300){
      dinoY = 300;
      isDinoJumping = false;
      }
      
      fill(0);
      textSize(30);
      //text("Score" + gameScore);
    }
   
    

void keyPressed(){
  if (key == ' ' && !isDinoJumping) {
  dVelocity = -10;
  isDinoJumping = true;
  }
}
  //key pressed boolean or key pressed()?

//void gameOver(){}
//get() for color hit on object
//enemy as own object
