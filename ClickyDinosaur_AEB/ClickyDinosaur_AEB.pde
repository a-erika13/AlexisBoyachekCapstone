// REMINDER! pull orgin BEFORE starting to work
//Clicky Dinosaur Capstone Final Project AEB

//import all Java utilities just in case
import java.util.*;

//declare array list for enemies
ArrayList<Cactus> enemies;

float groundY = 200;

float dGravity = 0.5;
float dinoSize = 50;
float dinoX = 65;
float dinoY = 300;
float dVelocity = 0;
float dinoJump = -15;
boolean isDinoJumping = false; //determines if game continues (dino isn't jumping and hits obstacle, game over)

boolean gameOver = false;
int gameScore = 0;

void setup() 
{
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
    
    //scoreboard for time in game
    fill(0);
    textSize(30);
    text("Score" + gameScore, 10, 30);
    if(!gameOver)
    {
      gameScore++;
    }
    
    else
    {
      fill(255, 0, 0);
      textSize(50);
      text("r to reset game", width /4-80, height /2);
      
    }
    
    
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
  if (key == ' ' && !isDinoJumping) 
  {
  dVelocity = -10;
  isDinoJumping = true;
  }
  if(key == 'r')
  {
    dinoX = 50;
    dinoY = 300;
    dVelocity = 0;
    isDinoJumping = false;
    enemies.clear();
    gameOver = false;
    gameScore = 0;
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

//checking for the point avatar and enemy could collide
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
      enemies.add(new Cactus(width, 325, 20, 10));
     }
     
     for (int i = enemies.size() - 1; i >= 0; i--)
     {
       Cactus c = enemies.get(i);
       c.refresh();
       c.screen();
       if (c.x + c.width < 0) 
       {
        enemies.remove(i);
       }
     }
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
  x -= v;
}

void screen(){
  fill(0, 50, 150);
  rect(x, y, width, height);
}
}
