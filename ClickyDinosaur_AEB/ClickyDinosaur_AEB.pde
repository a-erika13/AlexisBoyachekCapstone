// REMINDER! pull orgin BEFORE starting to work
// millis() function (use to increase difficulty as game continues)
//Returns the number of milliseconds (thousandths of a second) since starting the sketch. This information is often used for timing animation sequences.
//Clicky Dinosaur Capstone Final Project AEB
// draw dino later?
import java.util.*;

ArrayList<Cactus> enemies;

float groundY = 200;

float dGravity = 1;
float dinoSize = 50;
float dinoX = 65;
float dinoY = 300;
float dVelocity = 0;
float dinoJump = -10;
boolean isDinoJumping = false; //determines if game continues (dino isn't jumping and hits obstacle, game over)

boolean gameOver = false;
int gameScore = 0;

void setup() {
    size(1280, 720);
    background(154, 206, 235);
    enemies = new ArrayList<Cactus>();
    //allows to keep tracl of when cacti leave the screen
    frameRate(60);
}

void draw() 
{
    background(154, 206, 235);
    //ground
    line(0, 350, width, 350);
    
    //scoreboard for each object avoided
    fill(0);
    textSize(30);
    text("Score" + gameScore, 10, 30);
    
    if(!gameOver)
    {
      dinoAvatar();
    }
     
     //call function to create enemies
     cactiObstacles();
     
     //call functions to check for crashes
     crash();
}

//avatar jumps when space bar is pressed
void keyPressed()
{
  if (key == ' ' && !isDinoJumping) {
  dVelocity = -10;
  isDinoJumping = true;
  }
}

//checks for avatar colliding with cacti
void crash()
{
  for(int cr = 0; cr < enemies.size(); cr++)
  {
    Cactus c = enemies.get(cr);
    if (get((int)c.x, (int)c.y) != 0 && rectIntersect(dinoX, dinoY, dinoSize, dinoSize, c.x, c.y, c.height, c.width))
    {
      gameOver = true;
    }

  }
}
  boolean rectIntersect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) 
  {
  return x1 < x2 + w2 && x1 + w1 > x2 && y1 < y2 + h2 && y1 + h1 > y2;
  }


void dinoAvatar()
{
  //dino avatar
    fill(0, 255, 0);
    rect(dinoX, dinoY, dinoSize, dinoSize);
    dVelocity += dGravity;
    dinoY += dVelocity;
    //keep dino on the ground as default
    if (dinoY >= 300)
    {
      dinoY = 300;
      isDinoJumping = false;
    }
}

void cactiObstacles()
{
  //create obstacles
     if(frameCount % 60 == 0)
     {
      enemies.add(new Cactus(width, 315, 20, 35));
     }
     
     for (int i = enemies.size() - 1; i >= 0; i--)
     {
       Cactus c = enemies.get(i);
       c.refresh();
       c.screen();
}

class Cactus
{
  float x, y, height, width;
  float v;
  
  Cactus(float x, float y, float height, float width)
  {
    this.x = x;
    this.y = y;
    this.height = height;
    this.width = width;
    this.v = 5;
  }

void refresh(){
  x-=speed;
}

void screen(){
  fill(0, 50, 150);
  rect(x, y, width, height);
}
}
