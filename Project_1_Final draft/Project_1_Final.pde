class Star2 {
  constructor() {
    this.x = random(-width,width);
    this.y = random(-height,height);
    this.z = random(width);
  
    this.pz = this.z;
  }
  update() {
    this.z = this.z - speed;
    if(this.z < 1){
      this.z = width;
      this.x = random(-width,width);
      this.y = random(-height,height);
      this.pz = this.z;
    }
  }
  show() {
    fill(250, 250, 200);
    noStroke();
    let sx = map(this.x/this.z,0,1,0,width);
    let sy = map(this.y/this.z,0,1,0,height);
  
    let r = map(this.z,0,width,16,0);
  
    ellipse (sx,sy,r,r);

    let px = map(this.x /this.pz,0,1,0,width);
    let py = map(this.y /this.pz,0,1,0,height);
  
    this.pz = this.z;
    stroke(255);
    line(px,py,sx,sy);
  
  }
}
class Moon {
  constructor(xMoon,yMoon,sizeMoon){
    this.xMoon = xMoon;
    this.yMoon = yMoon;
    this.sizeMoon = sizeMoon;
  
  }
  display(){
    noStroke();
    fill(lerpColor(color(255,250,216), color(255), 0.3)); //light shade of yellow
    ellipseMode(CENTER);
    ellipse(this.xMoon, this.yMoon, this.sizeMoon + increment);
    }
  update (){
    if (increment < 225){ //want the moon to stop increasing when it reaches 225
      
      increment ++; //using increment as I want the size of the moon to increase with time
      
  }
}
}
class Tree {
  constructor(xTree, yTree, heightTree,radiusTree){
    this.xTree = xTree;
    this.yTree = yTree;
    this.heightTree = heightTree;
    this.initialx = xTree;
    this.initialy = yTree;
    this.initialHeight = heightTree;
    this.initialRadius = radiusTree;

  }
  display(){
    fill(163,96,56);
    rect(this.xTree,this.yTree,10,this.heightTree);
    fill(107, 252, 3);
    ellipseMode(CENTER);
    ellipse(this.xTree+5,this.yTree,this.radiusTree);
  }
  update(){
    if(this.xTree<400){
      this.heightTree-=0.3;
      this.radiusTree+=0.2;
      this.xTree-=9;
      this.yTree+=9;
    } else {
      this.heightTree-=0.3;
      this.radiusTree+=0.2;
      this.xTree+=9;
      this.yTree+=9;
    }
    if(this.xTree<0){
      this.xTree = 390;
      this.yTree = 400;
      this.heightTree = -50;
    } else if (this.xTree>800){
      this.xTree = 410;
      this.yTree = 400;
      this.heightTree = -50;
    }
    
    print(this.xTree,this.yTree);
  }
}

let frame = 1;
let stars = [];
let speed;
let increment = 0;
let cloud1 = 50;
let cloud2 = 50; 

moon = new Moon(400,400,10);

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
  background(0);
   speed = map(1200,0,width,0,50); //since my theme is fast, I chose high speed
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
    fill(187,231,246);
    triangle(0,0,400,400,0,800); 
    triangle(800,0,400,400,800,800); 
    fill(215,245,247);
    triangle(0,0,400,400,800,0); 
    fill(214,207,193);
    triangle(0,800,400,400,800,800); 

  //train track 
  stroke(5);
  line(400, 400, 0, 800);
  line(400,400,800,800);
 
  
  noStroke();
  
  fill(163,96,56);
  rect(360,440, 80, 9);
  rect(300,500,200,9);
  rect(240,560,320,9);
  rect(180,620,440,9);
  rect(120,680,560,9);
  rect(60,740,680,9);
  fill(255);
  rect(400,800,400,10);
  fill(0);
  ellipse(370, 445, 5, 4.5);
 
  //train 
  noStroke();
  fill(235,16,8);
  rect(370,600, 55, 55, 20, 20, 10, 10);
  fill(0);
  rect(387, 583, 15, 18);

  fill(0);
  rect(360,655,75,55,20,20,10,10);
  rect(350,705,95,55,20,20,10,10);
  rect(340,760,115,55,20,20,10,10);
  
  

  //clouds
  createcloud(cloud1+300,cloud2-15);
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

 function mousePressed() {
  
  frame++;
  if (frame > 2) { //since there are a total of two screens 
    frame = 1; //to go back to screen 1 after screen 2
  }
}
