//Goal spawns
var rand = irandom(360);
var xx = objCircle.animatedPoints[rand][0];
var yy = objCircle.animatedPoints[rand][1];
var goal = instance_create_layer(xx, yy, layer, objGoal);
goal.follow = rand;