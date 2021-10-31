let stars = [];
let stillstar = [];
let aStar;
let bStar;
let cStar;
let speed;
let increment = 0;

function setup() {
  createCanvas(800,800);
  for(i = 0; i < 800;i++) {
  stars[i]= new Star2();
  }
  moon = new Moon(-400,-400,10);
  let index = 0;
    for (let j = -200; j < 300; j += 100) {
      for (let k = -200; k < 200; k += 100) {
        //stillstar[index++] = new Stillstars(j, k, 5);
      }
    
  }
  let xRand = random(-300, 300);
  let yRand = random(-200, 200);
     aStar = new Stillstars(xRand, yRand, 5);
  
  let uRand = random(-300,300);
  let wRand = random(-200,200);
      bStar = new Stillstars(uRand, wRand, 4);
  
  let tRand = random(-300,300);
  let vRand = random(-250,200);
      cStar = new Stillstars(tRand, vRand, 6);
}

function draw() {
  speed = map(1200,0,width,0,50); //since my theme is fast, I chose high speed
  background(11,32,66); //wanted it to be blackish abd blushish shade, like night sky
  translate(width/2,height/2);
  for(let i = 0; i< stars.length; i++){
    stars[i].update();
    stars[i].show();
  }
  moon.display();
  for (let i = 0; i < stillstar.length; i++) {
    //stillstar[i].display();
  }
  aStar.display();
  bStar.display();
  cStar.display();
}

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
    ellipse(this.xMoon, this.yMoon, this.sizeMoon + increment, this.sizeMoon + increment);
    if (increment < 225){ //want the moon to stop increasing when it reaches 225
      
      increment ++; //using increment as I want the size of the moon to increase with time
      
      }
    }
  }
  class Stillstars {
    constructor(xstar,ystar,starsize){
      this.xstar = xstar;
      this.ystar = ystar;
      this.starsize = starsize;
      
    }
    display(){
      ellipse(this.xstar,this.ystar,this.starsize,this.starsize);
  
    }
  }
  
