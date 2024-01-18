
if not instance_exists(target) exit; // se não ouver player não acontece camera

// definições para camera
x = lerp(x, target.x ,0.1);
y = lerp(y, target.y-heigth_/4 ,0.1);

camera_set_view_pos(view_camera[0], x-width_/2, y-heigth_/2);


