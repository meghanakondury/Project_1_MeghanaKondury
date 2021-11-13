//Meghana Kondury's Midterm Project
//My adjective is fast

class Star2 {    //shooting stars for scene 1 
  constructor() {
    this.xstar = random(-width,width);
    this.ystar = random(-height,height);
    this.zstar = random(width);
  
    this.pz = this.zstar;
  }
  update() {
    this.zstar = this.zstar - speed;
    if(this.zstar < 1){
      this.zstar = width;
      this.xstar = random(-width,width);
      this.ystar = random(-height,height);
      this.pz = this.zstar;
    }
  }
  show() {
    fill(250, 250, 200);
    noStroke();
    let sx = map(this.xstar/this.zstar,0,1,0,width);
    let sy = map(this.ystar/this.zstar,0,1,0,height);
  
    let r = map(this.zstar,0,width,16,0);
  
    ellipse (sx,sy,r,r);  //my shooting stars consist of ellipses and lines. 

    let px = map(this.xstar /this.pz,0,1,0,width);
    let py = map(this.ystar /this.pz,0,1,0,height);
  
    this.pz = this.zstar;
    stroke(255);
    line(px,py,sx,sy);   //used line to give a better 3D effect of stars
  
  }
}
class Moon {   //moon with its size changing with time for scene 1 
  constructor(xMoon,yMoon,sizeMoon){
    this.xMoon = xMoon;
    this.yMoon = yMoon;
    this.sizeMoon = sizeMoon;
  
  }
  display(){
    noStroke();
    fill(color(255,250,216), color(255), 0.3); // wanted to give it a light shade of yellow
    ellipseMode(CENTER);
    ellipse(this.xMoon, this.yMoon, this.sizeMoon + increment);
    }
  update (){
    if (increment < 180){ //want the moon to stop increasing when it reaches 180
      increment ++; //using increment as I want the size of the moon to increase with time
      
  }
  }
}
class Tree {    //to create moving trees for scene 2 
  constructor(xTree, yTree, heightTree,radiusTree){
    this.xTree = xTree;
    this.yTree = yTree;
    this.heightTree = heightTree;
    this.initialx = xTree;
    this.initialy = yTree;
    this.initialHeight = heightTree;
    //this.initialRadius = radiusTree;

  }
  display(){
    fill(163,96,56);
    rect(this.xTree,this.yTree,10,this.heightTree);  //these rectanagles are the trunk of the trees
    fill(107, 252, 3);  //wanted to use ellipse like a bush on top of the rectangles as the leaves and branches of the tree, but I was not able to do this. I have checked all the possible issues and tried doing it in different ways. But I was not able to get those ellipses seen on screen 
    ellipseMode(CENTER);
    ellipse(this.xTree+5,this.yTree,this.radiusTree);
  }
  update(){
    if(this.xTree<400){  //that is where I want my tree trunks to start
      this.heightTree-=0.3; //change in the trucks position
      this.radiusTree+=0.2;
      this.xTree-=9;
      this.yTree+=9;
    } else {
      this.heightTree-=0.3;
      this.radiusTree+=0.2;
      this.xTree+=9;
      this.yTree+=9;
    }
    if(this.xTree<0){   //to get back those trucks to the original postiton and run again
      this.xTree = 390;
      this.yTree = 400;
      this.heightTree = -50;
    } else if (this.xTree>800){  //this is to get back the right side trunks to the original position 
      this.xTree = 410;
      this.yTree = 400;
      this.heightTree = -50;
    }
    
    print(this.xTree,this.yTree);
  }
}

let frame = 1;  //naming my scenes as frames
let stars = [];  //used an array for creating the shooting stars
let speed;  //used this for controlling the speed of my stars
let increment = 0;  //used this for the moon
let cloud1 = 50;  //called two clouds for scene 2 
let cloud2 = 50; 

moon = new Moon(0,400,10); //positioned the moon at the bottom of the frame, to give an effect like the moon is also moving forward and is in motion 

//created eight trees in different locations with equal distance between them
tree1 = new Tree(390,400,-50,10); 
tree2 = new Tree(300,490,-65,10);
tree3 = new Tree(200,590,-80,10);
tree4 = new Tree(100,690,-100,10); 
tree5 = new Tree(410,400,-50,10);
tree6 = new Tree(480,490,-65,10);
tree7 = new Tree(570,590,-80,10);
tree8 = new Tree(660,690,-100,10);

function setup() {
  createCanvas(800,800);
  for(i = 0; i < 800;i++) { 
  stars[i]= new Star2();
  }

}
function draw() {
 if (frame == 1){
   scene1();
 }
  else if (frame == 2) {
    scene2();
  }
}

function scene1() {
   speed = map(1300,0,width,0,50); //since my theme is fast, I chose high speed
  background(11,32,66); //wanted it to be blackish abd blushish shade, like night sky
  translate(width/2,height/2);
  for(let i = 0; i< stars.length; i++){
    stars[i].update();
    stars[i].show();
  }
  moon.update();
  moon.display();
  
}

function scene2(){
  
//Background setting 
    noStroke();
    fill(187,231,15);
    triangle(0,0,400,400,0,800); 
    triangle(800,0,400,400,800,800); 
    fill(215,245,247);
    triangle(0,0,400,400,800,0); 
    fill(214,207,193);
    triangle(0,800,400,400,800,800); 
  fill(242,167,12);
    ellipse(738,25,50,50)
  
  //train track 
  stroke(5);
  line(400, 400, 0, 800);
  line(400,400,800,800);
 
  
  noStroke();
  
  fill(99,98,97);
  rect(360,440, 80, 9); 
  rect(300,500,200,9);
  rect(240,560,320,9);
  rect(180,620,440,9);
  rect(120,680,560,9);
  rect(60,740,680,9);
  rect(400,800,400,10);
  
  fill(0);
  ellipse(370,445, 5, 4.5); //created bolts for train track
  ellipse(430,445,5,4.5);
  ellipse(315,505,5,4.5);
  ellipse(488,505,5,4.5);
  ellipse(250,565,5,4.5);
  ellipse(550,565,5,4.5);
  ellipse(190,625,5,4.5);
  ellipse(610,625,5,4.5);
  ellipse(125,685,5,4.5);
  ellipse(675,685,5,4.5);
  ellipse(68,745,5,4.5);
  ellipse(730,745,5,4.5);
 
  //train   
  ////created larger rectangles each time to create an effect like we are watching a running train
  stroke(255,255,51);
  fill(235,16,8);
  rect(370,600, 55, 55, 20, 20, 10, 10);
  fill(0);
  rect(387, 583, 15, 18);

  fill(0);
  rect(360,655,75,55,20,20,10,10);
  rect(350,705,95,55,20,20,10,10);
  rect(340,760,115,55,20,20,10,10);

  //clouds
  createcloud(cloud1+300,cloud2-30);
  createcloud(cloud1+150,cloud2+100);
  
  tree1.update();
  tree2.update();
  tree3.update();
  tree4.update();
  tree5.update();
  tree6.update();
  tree7.update();
  tree8.update();
  tree1.display();
  tree2.display();
  tree3.display();
  tree4.display();
  tree5.display();
  tree6.display();
  tree7.display();
  tree8.display();
  
    
}

function createcloud (cloud1,cloud2){
  fill(250)
  noStroke();
  ellipse(cloud1,cloud2, 70,50);
  ellipse(cloud1 + 10, cloud2 + 10, 120,50);
  ellipse(cloud1 - 20, cloud2 + 10, 50,50);
 
}
 function mousePressed() {  //change of scene when mouse pressed 
  
  frame++;
  if (frame > 2) { //since there are a total of two screens 
    frame = 1; //to go back to screen 1 after screen 2
  }
}
