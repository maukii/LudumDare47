var me = ds_list_find_index(objSpiral.pointList, id);
objSpiral.pointList[| 1].lineEnd = noone;
objSpiral.pointList[| 1].shouldDraw = false;
ds_list_delete(objSpiral.pointList, me);

objPlayer.point--;
if (objPlayer.follow == id) objPlayer.isDead = true;

instance_destroy();