// REMINDER! pull orgin BEFORE starting to work
// millis() function (use to increase difficulty as game continues)
//Returns the number of milliseconds (thousandths of a second) since starting the sketch. This information is often used for timing animation sequences.
//Clicky Dinosaur Capstone Final Project AEB
// draw dino later?
float groundY = 300;
float dGravity = 1;
float dinoSize = 50;
float dinoX = 65;
float dinoY = 400;
float velocityY = 0;
float dinoJump = -10;
boolean isDinoJumping = false; //determines if game continues (dino isn't jumping and hits obstacle, game over)
int gameScore = 0;

void setup() {
    size(1280, 720);
}

void draw() {
    background(154, 206, 235);
    //ground color bellow (make sure to change later)
    fill(150);
    rect(0, groundY, height, width - groundY);
}
void keyPressed(){
}
