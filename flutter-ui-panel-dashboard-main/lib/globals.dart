library my_prj.globals;

// Obtain a list of the available cameras on the device.
var cameras;

// Get a specific camera from the list of available cameras.
var firstCamera;

var matrix = List.filled(9, 0, growable: false);
var chocolate = [1, 0, 1, 0, 1, 0, 1, 0, 1];
var vanilla = [0, 1, 0, 1, 0, 1, 0, 1, 0];
var coffee = [0, 0, 0, 0, 1, 0, 0, 0, 0];
var water = [1, 0, 1, 1, 1, 0, 0, 0, 1];
int total = 0;

var cart = List.filled(9, "", growable: false);
var currProduct = "";