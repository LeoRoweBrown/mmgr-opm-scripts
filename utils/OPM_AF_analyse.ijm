// open("C:\\Users\\OPMuser\\Desktop\\DELETEME2\\MMStack_Default.ome.tif");
// run("Duplicate...", "duplicate");
min_otsu_thresh = parseInt(getArgument);
run("Rotate 90 Degrees Left");
run("Z Project...", "projection=[Max Intensity]");
makeRectangle(8, 0, 992, 1280);
run("Crop");

makeRectangle(0, 0, 992, 1280);
run("Clear Results");
run("Measure");
min = getResult("Min", 0);

run("Auto Threshold", "method=Otsu white show");

logString = getInfo("log");
logArray = split(logString, "\n");
otsustr = logArray[logArray.length-1];
otsu_val = split(otsustr, ": ");
otsu_val_int = parseInt(otsu_val[1]);


print(min_otsu_thresh);
if (otsu_val_int-min < min_otsu_thresh){
	print("otsu thresh minus min is: " + (otsu_val_int-min));
	return "null";
}
	
run("Dilate");
makeRectangle(0, 0, 992, 1280);
// run("Plot Profile");
run("Clear Results");
profile = getProfile();
y_from_bottom = 0;

for (i=0; i<profile.length; i++){
	// print("value: " + profile[profile.length-i-1]);
	if (profile[profile.length-i-1] > 1) {
		y_from_bottom = i;
		print("found: " + profile.length-i-1 + "px");
		break;
	}
}

print("y from bottom: ", y_from_bottom);

return ""+y_from_bottom;