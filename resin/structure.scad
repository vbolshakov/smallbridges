include <printer.scad>;

$fn = 12; // 36
$detailed = false; // true
$display_projection = true;

rotate([90,0,0]) {
  printer(2);
}