writedir = getArgument;
// File.makeDirectory(writedir);

selectWindow("MAX_z_stack");
saveAs("Tiff", writedir + "\\MAX_z_stack.tif");
close("MAX_z_stack.tif");
selectWindow("z_stack");
saveAs("Tiff", writedir + "\\z_stack.tif");
close("z_stack.tif");