opm_parameters() {
	trg_dist = 1.4; //trigger distance in micron
	double travel_speed = 10;  // travel speed mms/(?)
	double[] scan_speeds = {0.1; 0.1; 0.1; 0.1;}
	dist_from_ctr = 250;  // half of the total scan distance in um
	movetimeout_s = 60;  // timeout for stage travel
	scan_tries = 3;  // general retry count until skipping field
	max_retries = 3;  // maximum number of retries before skipping
	max_field_skips = 3; // maximum skips per run before stopping
	max_dropped_frames = 1; // maximum dropped frames
	
	// Time-lapse parameters 
	n_run = 1;
	// n_run = 1;
	run_interval = 30; // in minutes
	
	unset("fw_pos"); // z-prefind uses this name unfortunately

	int[] fw_pos =  {2};// {5,3,2,1}; // {3}; // //
	int[] las_channels =  {2}; //{1};//;  // DAQ channels corresponding to each fw pos
	// int[] wavelengths = {457, 515, 561, 642};
	int[] wavelengths =  {488, 515, 561, 642};
	float[] amplitudes = {5};// {5,5,5,5}; // {1};
	int[] exposures  =   {5};// {50,50,50,50}; 

	check_exp_with_scanspeed(){
		print("not implemented");
		for (i=0; i<exposures.length; i++){
			time_between_trig_ms = trg_dist/scan_speeds[i];
			// set max duty cycle to 90%?
			if (0.9*exposures[i] > time_between_trig_ms){
				print("WARNING: Exposure too long or scan_speed to fast for pair:" +
				"scan_speed = " + scan_speed[i] + " and exposure = " + exposures[i]);
				new_trig_time_ms = 0.9*exposures[i];
				scan_speeds[i] = trg_dist/new_trig_time_ms;
			}
		}
	}
    return this;
}