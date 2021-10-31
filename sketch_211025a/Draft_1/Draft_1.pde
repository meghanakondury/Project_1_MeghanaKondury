let stars; //to create stars 
var gradient = 100;
var moonSize =80

function setup(){
  createCanvas(800,800); 
  
   stars=[400,200,0,-200,-400,-600,-700,-900,-1200,-1400,-1600,-1800,-2100,-2400,-2500,-2700,-3000,-3200,-3400,-3600,-3800, -4000,-4400]
  
}
  
function draw(){
 background(11,32,66);
  
for(var moon = gradient; moon > 2; moon = moon - 1){ 
    var moonSize = map(moon, gradient, 0, 250, 150); //size of moon
    noStroke();
  fill(lerpColor(color(17,192,245), color(255), 1 - moon * 6/10 / gradient * 1/2));
 ellipse(0,0,moonSize);
}

  
  push()
  
  translate(0,500)
  
  for(let i=0; i<stars.length; i++)
    {
      fill(250, 250, 200)
      ellipse(50*i,stars[i]-730,random(10,-12))
      ellipse(150+i,stars[i],random(10,-12),random(10,-12))
      ellipse(210,stars[i],random(10,-12),random(10,-12))
      ellipse(305-i,stars[i],random(10,-12),random(10,-12))
      ellipse(415+i,stars[i],random(10,-12),random(10,-12))
      ellipse(500*i,stars[i],random(10,-12))
      ellipse(570+i,stars [i], random(10,-12))
      ellipse(660, stars [i], random(10,-12))

    } 
  pop()
}
