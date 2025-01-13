// REMINDER! pull orgin BEFORE starting to work
// millis() function (use to increase difficulty as game continues)
//Returns the number of milliseconds (thousandths of a second) since starting the sketch. This information is often used for timing animation sequences.
//Clicky Dinosaur Capstone Final Project AEB
// draw dino later?
ArrayList<cactus> enemies;
float groundY = 200;

float dGravity = 1;
float dinoSize = 40;
float dinoX = 65;
float dinoY = 300;
float dVelocity = 0;
float dinoJump = -10;
boolean isDinoJumping = false; //determines if game continues (dino isn't jumping and hits obstacle, game over)

float cactiX;
float cactiY;
float cactiSize = 5;
float cVelocity = 5;

float mls = millis();

boolean gameOver = false;
int gameScore = 0;

void setup() {
    size(1280, 720);
    enemies = new ArrayList<cactus>();
}

void draw() {
    background(154, 206, 235);
    //ground
    line(0, 350, width, 350);
    //fill ground as a grey color later
    //fill(0);
    //rect(1280, 200, 1280, 300);
    
      //temporary dino
    fill(0, 255, 0);
    //dino head
    rect(dinoX, 250, dinoSize, dinoSize);
    dVelocity += dGravity;
    dinoY += dVelocity;
    //keep dino on the ground as default
    if (dinoY >= 300){// (make dinoY the feet)
      dinoY = 300;
      isDinoJumping = false;
      }
      
      //score board for each obsacle avoided
      fill(0);
      textSize(30);
      text("Score" + gameScore, 10, 20);
      
      //every 20 seconds, speed increases by 1
      if (mls == 20000){
        dVelocity++;
      }
    }

void keyPressed(){
  if (key == ' ' && !isDinoJumping) {
  dVelocity = -10;
  isDinoJumping = true;
  }
}

class cactus{
  
}
//get() or set() function to check for enemies
  //key pressed boolean or key pressed()?

//void gameOver(){}
//get() for color hit on object
//enemy as own object
