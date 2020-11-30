

Hercules = {
	Name 				=   'Hercules',
	DisplayName			= _('Hercules'),
	Picture 			= "Hercules.png",
	Rate 				= 70, -- RewardPoint in Multiplayer
	Shape 				= "Hercules",
	WorldID				= WSTYPE_PLACEHOLDER,
	defFuelRatio		= 0.6, -- fuel default in fractions of the full (1.0)
	
	shape_table_data 	= 
	{
		{
			file  	 	= 'Hercules';
			life  	 	= 20; -- lifebar
			vis   	 	= 3; -- visibility gain.
			desrt    	= 'Hercules_destr'; -- Name of destroyed object file name
			fire  	 	= { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username	= 'Hercules';
			index    	=  WSTYPE_PLACEHOLDER;
			classname = "lLandPlane";
			positioning = "BYNORMAL";
		},
		{
			name  = "Hercules_destr";
			file  = "C-130-oblomok";
			fire  = { 240, 2};
		},

	},
	
	-- Overwing vapors code
	-- effects_presets = {
  	-- {effect = "OVERWING_VAPOR", file = current_mod_path.."/Effects/Mig-23UBOverWingVapor.lua"},
	-- },
  	
	
	takeoff_and_landing_type = "VTOL",
	
	-- add model draw args for network transmitting to this draw_args table (32 limit)
	net_animation ={
					38,  -- Doors
					274,  -- CargoRamp_VehicleRamp 
					-- 0000,  -- Args3 
					-- 1215,  -- Args4 CargoDoor
					-- 1216,  -- Args5 CargoRamp
					-- 1217,  -- Args6 Crew_Entrance_Door
					1204,  -- Args7 CargoFWD_CrewLoad_Anim
					1205,  -- Args8 CargoMID_CrewLoad_Anim
					1206,  -- Args9 CargoAFT_CrewLoad_Anim
					1282,  -- Args10 CargoFWD_AirDrop_Anim
					1283,  -- Args11 CargoMID_AirDrop_Anim
					1284,  -- Args12 CargoAFT_AirDrop_Anim
					-- 1008,  -- Args13 EnginePropContRot
					-- 1036,  -- Args14 Engine1NP
					-- 1040,  -- Args15 Engine1PropRotation
					-- 1032,  -- Args16 Engine1PropFeather_Rotate
					-- 1037,  -- Args17 Engine2NP
					-- 1041,  -- Args18 Engine2PropRotation
					-- 1033,  -- Args19 Engine2PropFeather_Rotate
					-- 1038,  -- Args20 Engine3NP
					-- 1042,  -- Args21 Engine3PropRotation
					-- 1034,  -- Args22 Engine3PropFeather_Rotate
					-- 1039,  -- Args23 Engine4NP
					-- 1043,  -- Args24 Engine4PropRotation
					-- 1035,  -- Args25 Engine4PropFeather_Rotate
					1074,  -- Args26 LeftLandingLight_Spot_Illumination
					1075,  -- Args27 RightLandingLight_Spot_Illumination
					1076,  -- Args28 LeftLandingLight_Spot_Rotate
					1077,  -- Args29 RightLandingLight_Spot_Rotate
					1079,  -- Args30 Taxi_Lights_Spot_Illumination
					-- 0000,  -- Args31 
					-- 0000,  -- Args32 
					},
					
	mapclasskey = "P0091000029",
	attribute  			= {wsType_Air, wsType_Airplane, wsType_Battleplane, WSTYPE_PLACEHOLDER ,"Battleplanes",},
	Categories = {"{C168A850-3C0B-436a-95B5-C4A015552560}", "Plane",},
	
	M_empty 				= 39765, -- kg (Empty Plus with crew) 87667 lb
	M_nominal 				= 59620, -- kg (Empty Plus Full Internal Fuel) 131440 lb
	M_max 					= 79379, -- kg Maximum Take Off Weight 175000 lb
	M_fuel_max 				= 19759,-- kg Total Internal fuel (4 main tanks + left and right aux tanks, all in wings) 43560 lb
------------------------- Max Landing Weight, 9 fps: 135000 lb
------------------------- Max Landing Weight: 164000 lb
------------------------- Max Payload: 47812 lb (21687 kg)
	H_max 					= 12310, -- m  Absolute altitude
	average_fuel_consumption	=	0.385,--kg/s -- at 25000 ft 347 kg (765 pounds) per hour per engine
	has_afteburner	=	false,
	has_speedbrake	=	false,
	tanker_type	=	0,
	wing_area	=	162.1,
	wing_span	=	40.41,
	wing_type	= 0, -- Fixed wing				**
	--4 ? Rolls-Royce AE 2100D3 turboprop, 4,637 shp (3,458 kW) each - 3,458 kilowatt = 3458 newton meter/second
	thrust_sum_max	=	13832,-- thrust in kgf, 4 * 3458 newton = 13832 kilogram-force
	thrust_sum_ab	=	13832,
	length	=	34.36,
	height	=	11.84,
	RCS	=	80,
	IR_emission_coeff	=	1,
	IR_emission_coeff_ab	=	0,
	wing_tip_pos = 	{-1.90, 0.56, 19.93},
---------- AI Flight Parameters -----------
	CAS_min	=	58,-- Minimum CAS speed (m/s) (for AI)
	V_opt	=	179,-- cruise m/s (for AI) 348 knts at 20000 ft
	V_take_off	=	61.728,-- Take off speed in m/s (for AI) 90 knts
	V_land	=	61,-- Landing speed in m/s (for AI) 100 knts
	V_max_sea_level	=	179,-- max m/s (for AI) 348 knts
	V_max_h	=	186,-- max m/s (for AI) 362 knts
	Vy_max	=	2.25,
	Mach_max	=	0.53,
	Ny_min	=	0.5,
	Ny_max	=	2.5,
	Ny_max_e	=	2,
	AOA_take_off	=	0.1,
	bank_angle_max	=	30,
	flaps_maneuver	=	1,
	range	=	3890,
		
	brakeshute_name 			= 0, -- Landing - brake chute visual shape after separation
	is_tanker 					= false, -- Tanker yes/no
	air_refuel_receptacle_pos 	= {0, 0, 0}, -- refuel coords
	engines_count				= 4, -- Engines count

	tand_gear_max	=	3.73,-- // tangent on maximum yaw angle of front wheel tan(75deg)
	nose_gear_pos 				= {12.5163, -4.6216,	0},   -- nosegear coord 
	nose_gear_amortizer_direct_stroke			= 	0.0,			-- down from nose_gear_pos !!!
	nose_gear_amortizer_reversal_stroke			= 	-0.342,			-- up
	nose_gear_amortizer_normal_weight_stroke	= 	-0.342,	-- down from nose_gear_pos
	nose_gear_wheel_diameter					=	0.873,
	
	main_gear_pos 				= {-0.7826, -4.6801, 2.1953}, -- main gear coords 
	main_gear_amortizer_direct_stroke			=	0.0,			-- down from main_gear_pos !!!
	main_gear_amortizer_reversal_stroke			= 	-0.342,			-- up
	main_gear_amortizer_normal_weight_stroke	= 	-0.342,	-- down from main_gear_pos
	main_gear_wheel_diameter					=	1.344,

	engines_nozzles = {
		[1] = -- ENGINE 1
		{
			pos = {-4.83, 0.34, -10.42},
				elevation = 0,
				diameter = 1.523,
				exhaust_length_ab = 11.794,
				exhaust_length_ab_K = 0.76,
				smokiness_level = 0.08, 
		}, -- end of [1]
		[2] = -- ENGINE 2
		{
			pos = 	{-5.39, 0.2, -5.16},
				elevation =	0,
				diameter = 1.523,
				exhaust_length_ab =	11.794,
				exhaust_length_ab_K	= 0.76,
				smokiness_level = 0.08, 
		}, -- end of [2]
		[3] = -- ENGINE 3
		{
			pos = 	{-5.39, 0.2, 5.16},
				elevation = 0,
				diameter = 1.523,
				exhaust_length_ab =	11.794,
				exhaust_length_ab_K	= 0.76,
				smokiness_level = 0.08, 
		}, -- end of [3]
		[4] = -- ENGINE 4
		{
			pos = {-4.83, 0.34, 10.42},
				elevation =	0,
				diameter = 1.523,
				exhaust_length_ab = 11.794,
				exhaust_length_ab_K	= 0.76,
				smokiness_level = 0.08, 
		}, -- end of [4]
		[5] = -- Rocket 1
		{
			pos = {-2.0, -4.0, -3.0},
				elevation =	0,
				diameter = 1.523,
				exhaust_length_ab =	11.794,
				exhaust_length_ab_K	= 0.76,
				smokiness_level = 1.0, 
		}, -- end of [5]
		[6] = -- Rocket 2
		{
			pos = {-2.0, -4.0, 3.0},
				elevation =	0,
				diameter = 1.523,
				exhaust_length_ab =	11.794,
				exhaust_length_ab_K	= 0.76,
				smokiness_level = 1.0, 
		}, -- end of [6]
	}, -- end of engines_nozzles
	crew_size	 = 2,
	crew_members = 
	{
		[1] =
		{
			ejection_seat_name	=	0,
			pilot_name		   = "Hercules_Pilot",			
			drop_canopy_name	=	0,
			pos = 	{0,0, 0},
			can_be_playable  = true,	
			role = "pilot",
			role_display_name = _("Pilot"),
		},
		[2] =
		{
			ejection_seat_name	=	0,
			pilot_name		   = "Hercules_Copilot",			
			drop_canopy_name	=	0,
			pos = 	{0,0, 0},
			can_be_playable  = true,	
			role = "instructor",
			role_display_name = _("Copilot"),
		},
	},
	
	--------- Sensors Characteristics ---------
    detection_range_max        = 250,
    radar_can_see_ground    =    true,
    CanopyGeometry = {
        azimuth   = {-160.0, 160.0}, -- pilot view horizontal (AI)
        elevation = {-50.0, 50.0} -- pilot view vertical (AI)
    },
	Sensors = {	-- defines what the AI can use in terms of sensors
        IRST = "OLS-27",
		OPTIC = {"TADS DVO"}, -- AI can engage enemy at night
		RWR = "Abstract RWR"
	},
	
    HumanRadio = {
        frequency = 254.0, -- Maykop (Caucasus) or Nellis (NTTR)
        editable = true,
        minFrequency = 225.000,
        maxFrequency = 399.900,
        modulation = MODULATION_AM
    },

    panelRadio = {
        [1] = {
            name = _("AN/ARC-51A"),
            range = {
                {min = 225.0, max = 399.9}
            },
            channels = {  -- matches L-39C except for channel 8, which was changed to a Georgian airport and #20 which is NTTR only (for now).  This radio goes 1-20 not 0-19.
                [1] = { name = _("Channel 1"),		default = 264.0, modulation = _("AM"), connect = true}, -- mineralnye-vody (URMM) : 264.0
                [2] = { name = _("Channel 2"),		default = 265.0, modulation = _("AM")},	-- nalchik (URMN) : 265.0
                [3] = { name = _("Channel 3"),		default = 256.0, modulation = _("AM")},	-- sochi-adler (URSS) : 256.0
                [4] = { name = _("Channel 4"),		default = 254.0, modulation = _("AM")},	-- maykop-khanskaya (URKH), nellis (KLSV) : 254.0
                [5] = { name = _("Channel 5"),		default = 250.0, modulation = _("AM")},	-- anapa (URKA) : 250.0
                [6] = { name = _("Channel 6"),		default = 270.0, modulation = _("AM")},	-- beslan (URMO) : 270.0
                [7] = { name = _("Channel 7"),		default = 257.0, modulation = _("AM")},	-- krasnodar-pashkovsky (URKK) : 257.0
                [8] = { name = _("Channel 8"),		default = 258.0, modulation = _("AM")},	-- sukhumi-babushara (UGSS) : 255.0
                [9] = { name = _("Channel 9"),		default = 262.0, modulation = _("AM")},	-- kobuleti (UG5X) : 262.0
                [10] = { name = _("Channel 10"),	default = 259.0, modulation = _("AM")},	-- gudauta (UG23) : 259.0
                [11] = { name = _("Channel 11"),	default = 268.0, modulation = _("AM")},	-- tbilisi-soganlug (UG24) : 268.0
                [12] = { name = _("Channel 12"),	default = 269.0, modulation = _("AM")},	-- tbilisi-vaziani (UG27) : 269.0
                [13] = { name = _("Channel 13"),	default = 260.0, modulation = _("AM")},	-- batumi (UGSB) : 260.0
                [14] = { name = _("Channel 14"),	default = 263.0, modulation = _("AM")},	-- kutaisi-kopitnari (UGKO) : 263.0
                [15] = { name = _("Channel 15"),	default = 261.0, modulation = _("AM")},	-- senaki-kolkhi (UGKS) :  261.0
                [16] = { name = _("Channel 16"),	default = 267.0, modulation = _("AM")},	-- tbilisi-lochini (UGTB) : 267.0
                [17] = { name = _("Channel 17"),	default = 251.0, modulation = _("AM")},	-- krasnodar-center (URKI), creech (KINS) : 251.0
                [18] = { name = _("Channel 18"),	default = 253.0, modulation = _("AM")},	-- krymsk (URKW), mccarran (KLAS) : 253.0
                [19] = { name = _("Channel 19"),	default = 266.0, modulation = _("AM")},	-- mozdok (XRMF) : 266.0
                [20] = { name = _("Channel 20"),	default = 252.0, modulation = _("AM")}, -- N/A, groom lake/homey (KXTA) : 252.0
            }
        },
    },
	
	InheriteCommonCallnames = true,
	
	----------- ECM Characteristics -----------
	Countermeasures = {
        ECM = "AN/ALQ-165"
	},
	
	passivCounterm = {
		CMDS_Edit = true,
		SingleChargeTotal = 180,
		chaff = {default =  60, increment = 30, chargeSz = 1},
		flare = {default = 120, increment = 30, chargeSz = 1}
	},

	chaff_flare_dispenser 	= {
		{ dir =  {0,  1, -0.75}, pos =  {-3.304,  0.469, -0.375}, }, -- Top Front Left
		{ dir =  {0,  1,  0.75}, pos =  {-3.304,  0.469,  0.375}, }, -- Top Front Right
		{ dir =  {0,  1, -0.75}, pos =  {-3.644,  0.469, -0.375}, }, -- Top Back Left
		{ dir =  {0,  1,  0.75}, pos =  {-3.644,  0.469,  0.375}, }, -- Top Back Right
		{ dir =  {0, -1, -0.15}, pos =  {-3.759, -0.743, -0.130}, }, -- Bottom Left
		{ dir =  {0, -1,  0.15}, pos =  {-3.759, -0.743,  0.130}, }, -- Bottom Right
	},
		
	
	--------- Armament Characteristics ---------
	pylons_enumeration = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14},
	Pylons =     {
        pylon(1, 0, 0.0, 0.0, 0.0,
            {
  				arg = 308, arg_value = 1.0, connector = "JATO", use_full_connector_position = true, DisplayName = "JATO"
			},
				{
					{ CLSID = "Herc_JATO", arg_value = 0.1,  attach_point_position = { 0.0, 0.0, 0.0} }, -- JATO_Rocket_Attachment
				}
        ),
		pylon(2, 0, 0.0, 0.0, 0.0,
            {
  				arg = 318, arg_value = 1.0, connector = "Pylon1", use_full_connector_position = true, DisplayName = "P1", droppable_shape = "F-5e3_pylon_02"
			},
				{
					-- Rockets
					{ CLSID	=	"{647C5F26-BDD1-41e6-A371-8DE1E4CC0E94}", arg_value = 0.10,	attach_point_position = { -0.085, -0.1500, 0.0} },	-- LAU68D (FFR x 7 Parachute illumination)
					{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Red-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Green-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	-- Blue-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- White-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Yellow-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Orange-Smoke
					-- FUEL TANKS --
					{ CLSID = "Herc_Ext_Fuel_Tank", arg_value = 0.10 },
				}
        ),
		pylon(3, 0, 0.0, 0.0, 0.0,
            {
  				arg = 312, arg_value = 1.0, connector = "Pylon2", use_full_connector_position = true, DisplayName = "P2", droppable_shape = "F-5e3_pylon_02"
			},
				{
					-- Rockets
					{ CLSID	=	"{647C5F26-BDD1-41e6-A371-8DE1E4CC0E94}", arg_value = 0.10,	attach_point_position = { -0.085, -0.1500, 0.0} },	-- LAU68D (FFR x 7 Parachute illumination)
					{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Red-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Green-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	-- Blue-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- White-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Yellow-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Orange-Smoke
					-- FUEL TANKS --
					{ CLSID = "Herc_Ext_Fuel_Tank", arg_value = 0.10 },
				}
        ),
		pylon(4, 0, 0.0, 0.0, 0.0,
            {
  				arg = 309, arg_value = 1.0, connector = "Pylon3", use_full_connector_position = true, DisplayName = "P3", droppable_shape = "F-5e3_pylon_02"
			},
				{
					-- Rockets
					{ CLSID	=	"{647C5F26-BDD1-41e6-A371-8DE1E4CC0E94}", arg_value = 0.10,	attach_point_position = { -0.085, -0.1500, 0.0} },	-- LAU68D (FFR x 7 Parachute illumination)
					{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Red-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Green-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	-- Blue-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- White-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Yellow-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Orange-Smoke
					-- FUEL TANKS --
					{ CLSID = "Herc_Ext_Fuel_Tank", arg_value = 0.10 },
				}
        ),
		pylon(5, 0, 0.0, 0.0, 0.0,
            {
  				arg = 310, arg_value = 1.0, connector = "Pylon4", use_full_connector_position = true, DisplayName = "P4", droppable_shape = "F-5e3_pylon_02"
			},
				{
					-- Rockets
					{ CLSID	=	"{647C5F26-BDD1-41e6-A371-8DE1E4CC0E94}", arg_value = 0.10,	attach_point_position = { -0.085, -0.1500, 0.0} },	-- LAU68D (FFR x 7 Parachute illumination)
					{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Red-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Green-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	-- Blue-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- White-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Yellow-Smoke
                	{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}", arg_value = 0.10,	attach_point_position = { -0.085, -0.0740, 0.0} },	 -- Orange-Smoke
					-- FUEL TANKS --
					{ CLSID = "Herc_Ext_Fuel_Tank", arg_value = 0.10 },
				}
        ),
        pylon(6, 0, 0.0, 0.0, 0.0,
            {
  				arg = 316, arg_value = 1.0, connector = "Can1", use_full_connector_position = true, DisplayName = "Can1"
			},
				{
					{ CLSID = "{Herc_M61_Vulcan_Rotary_Cannon}", arg_value = 0.10 },
				}
        ),
		pylon(7, 0, 0.0, 0.0, 0.0,
            {
  				arg = 314, arg_value = 1.0, connector = "Can2", use_full_connector_position = true, DisplayName = "Can2"
			},
				{
					{ CLSID = "{Herc_GAU_23A_Chain_Gun}", arg_value = 0.10 },
				}
        ),
        pylon(8, 0, 0.0, 0.0, 0.0,
            {
  				arg = 311, arg_value = 1.0, connector = "Can3", use_full_connector_position = true, DisplayName = "Can3"
			},
				{
					{ CLSID = "{Herc_105mm_Howitzer}", arg_value = 0.10 },
				}
        ),
		pylon(9, 0, 0.0, 0.0, 0.0,
            {
  				arg = 319, arg_value = 0.0, connector = "CargoAFT", use_full_connector_position = true, DisplayName = "C-AFT"
			},
				{
                    -- { CLSID = "Herc_Paratroop_Squad", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --30 X 70kg Paratroopers
                    ---------------------------------MISSILES AG-----------------------------------------------------
                    { CLSID = "Herc_Ammo_AGM_65D_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65D
                    { CLSID = "Herc_Ammo_AGM_65H_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65H
                    { CLSID = "Herc_Ammo_AGM_65G_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65G
                    { CLSID = "Herc_Ammo_AGM_65E_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65E
                    { CLSID = "Herc_Ammo_AGM_88C_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM88C
                    { CLSID = "Herc_Ammo_AGM_65K_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65K
					{ CLSID = "Herc_Ammo_Vikhr_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----VIHKR					
					{ CLSID = "Herc_Ammo_AGM_84A_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----agm84a
					{ CLSID = "Herc_Ammo_AGM_84E_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----agm84e
					{ CLSID = "Herc_Ammo_KH25ML_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH25ML
					{ CLSID = "Herc_Ammo_KH25MPU_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH25MPU
					{ CLSID = "Herc_Ammo_KH29T_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH29T
					{ CLSID = "Herc_Ammo_KH29L_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH29L
					{ CLSID = "Herc_Ammo_KH58U_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH58U
					{ CLSID = "Herc_Ammo_S24B_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----S24B
					{ CLSID = "Herc_Ammo_S25OFM_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----S25OFM
					{ CLSID = "Herc_Ammo_S25L_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----S25L
					---------------------------------------BOMBS-------------------------------------------------------------
                    { CLSID = "Herc_Ammo_GBU_10_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU10
                    { CLSID = "Herc_Ammo_GBU_12_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU12
                    { CLSID = "Herc_Ammo_GBU_16_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU16
                    { CLSID = "Herc_Ammo_GBU_31_VB_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU31V/B
                    { CLSID = "Herc_Ammo_GBU_31_V3B_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU31V3B
                    { CLSID = "Herc_Ammo_GBU_38_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU38
                   -- { CLSID = "Herc_Ammo_GBU_54_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU54
                    { CLSID = "Herc_Ammo_CBU_87_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --CBU87
					{ CLSID = "Herc_Ammo_CBU_97_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --CBU97
                    { CLSID = "Herc_Ammo_CBU_103_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --CBU103
                    { CLSID = "Herc_Ammo_CBU_105_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --CBU105
                    { CLSID = "Herc_Ammo_Mk_82_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, ---MK82
                    { CLSID = "Herc_Ammo_Mk_82AIR_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK82AIR
                    { CLSID = "Herc_Ammo_Mk_82Snake_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK82SNAKE
                    { CLSID = "Herc_Ammo_Mk_83_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK83
					{ CLSID = "Herc_Ammo_Mk_84_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK84
					{ CLSID = "Herc_Ammo_FAB100_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --FAB100
					{ CLSID = "Herc_Ammo_FAB250_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --FAB250
					{ CLSID = "Herc_Ammo_FAB500_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --FAB500
					{ CLSID = "Herc_Ammo_BETAB500_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --BETAB500
					{ CLSID = "Herc_Ammo_BETAB500SP_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --BETAB500SP
					{ CLSID = "Herc_Ammo_KAB500KR_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --KAB500KR
					{ CLSID = "Herc_Ammo_RBK250PTAB25M_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --RBK250PTAB25M
					{ CLSID = "Herc_Ammo_RBK500255PTAB105_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --RBK500255PTAB105
					{ CLSID = "Herc_Ammo_RBK500PTAB1M_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --RBK500PTAB1M
					{ CLSID = "Herc_Ammo_Herc_Ammo_M117_bombs_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --M117
					{ CLSID = "Herc_Ammo_KMGU296AO25RT_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --KMGU296AO25RT
					{ CLSID = "Herc_Ammo_KMGU296AO25KO_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --KMGU296AO25KO
					{ CLSID = "Herc_Ammo_MK20_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK20
					{ CLSID = "Herc_Ammo_SAB100_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --SAB100
					-----------------------------------------ROCKETS-----------------------------------------------------			
                    { CLSID = "Herc_Ammo_hydra_HE_rockets", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --HYDRA HE
					{ CLSID = "Herc_Ammo_hydra_WP_rockets", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --HYDRA WP
					--------------------------------------MISSLIES AA---------------------------------------------------------
                    { CLSID = "Herc_Ammo_AIM9M_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM9M
                    { CLSID = "Herc_Ammo_AIM9P5_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM9P5
                    { CLSID = "Herc_Ammo_AIM9X_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM9X
                    { CLSID = "Herc_Ammo_AIM7M_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM7M
                    { CLSID = "Herc_Ammo_AIM120B_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM120B
					{ CLSID = "Herc_Ammo_AIM120C_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM120C
					{ CLSID = "Herc_Ammo_R60M_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R60M
					{ CLSID = "Herc_Ammo_MAGIC2_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MAGIC2
					{ CLSID = "Herc_Ammo_R27R_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R27R
					{ CLSID = "Herc_Ammo_R27ER_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R27ER
					{ CLSID = "Herc_Ammo_R27T_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R27T
					{ CLSID = "Herc_Ammo_R27ET_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R27ET
					{ CLSID = "Herc_Ammo_R27_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R77
					{ CLSID = "Herc_Ammo_S530D_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --super530d
					{ CLSID = "Herc_Ammo_AIM54C_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM54
					------------------------------------------VEHICLES---------------------------------------------------
                    { CLSID = "Herc_APC_M1043_HMMWV_Armament", arg_value = 0.2, attach_point_position = { 0, 0, 0}},---3990kg Humvee
                    { CLSID = "Herc_ATGM_M1045_HMMWV_TOW", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --HUMVEE TOW
					{ CLSID = "Herc_APC_M1025_HMMWV", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, -- HUMVEE UNARMED
					{ CLSID = "Herc_SAM_M1097_HMMWV", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --HUMVEE AVENGER
					{ CLSID = "Herc_APC_COBRA", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, -- COBRA
					{ CLSID = "Herc_ARV_BRDM_2", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --BRDM-2
					{ CLSID = "Herc_URAL_375", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --ural 375
					{ CLSID = "Herc_TIGR_233036", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --tigr
					{ CLSID = "Herc_IFV_BMD1", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --bmd1
					{ CLSID = "Herc_IFV_BTRD", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --btrd
					{ CLSID = "Herc_ART_NONA", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --nona
					{ CLSID = "Herc_ART_M1A2_PALLATE", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --Abrams
					{ CLSID = "Herc_GEN_CRATE", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --Generic
			}
        ),
		pylon(10, 0, 0.0, 0.0, 0.0,
            {
  				arg = 320, arg_value = 0.0, connector = "CargoMID", use_full_connector_position = true, DisplayName = "C-MID"
			},
				{
					---------------------------------MISSILES AG-----------------------------------------------------
                    { CLSID = "Herc_Ammo_AGM_65D_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65D
                    { CLSID = "Herc_Ammo_AGM_65H_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65H
                    { CLSID = "Herc_Ammo_AGM_65G_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65G
                    { CLSID = "Herc_Ammo_AGM_65E_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65E
                    { CLSID = "Herc_Ammo_AGM_88C_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM88C
                    { CLSID = "Herc_Ammo_AGM_65K_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65K
					{ CLSID = "Herc_Ammo_Vikhr_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----VIHKR					
					{ CLSID = "Herc_Ammo_AGM_84A_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----agm84a
					{ CLSID = "Herc_Ammo_AGM_84E_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----agm84e
					{ CLSID = "Herc_Ammo_KH25ML_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH25ML
					{ CLSID = "Herc_Ammo_KH25MPU_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH25MPU
					{ CLSID = "Herc_Ammo_KH29T_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH29T
					{ CLSID = "Herc_Ammo_KH29L_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH29L
					{ CLSID = "Herc_Ammo_KH58U_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH58U
					{ CLSID = "Herc_Ammo_S24B_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----S24B
					{ CLSID = "Herc_Ammo_S25OFM_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----S25OFM
					{ CLSID = "Herc_Ammo_S25L_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----S25L
					---------------------------------------BOMBS-------------------------------------------------------------
                    { CLSID = "Herc_Ammo_GBU_10_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU10
                    { CLSID = "Herc_Ammo_GBU_12_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU12
                    { CLSID = "Herc_Ammo_GBU_16_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU16
                    { CLSID = "Herc_Ammo_GBU_31_VB_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU31V/B
                    { CLSID = "Herc_Ammo_GBU_31_V3B_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU31V3B
                    { CLSID = "Herc_Ammo_GBU_38_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU38
                    { CLSID = "Herc_Ammo_CBU_87_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --CBU87
					{ CLSID = "Herc_Ammo_CBU_97_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --CBU97
                    { CLSID = "Herc_Ammo_CBU_103_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --CBU103
                    { CLSID = "Herc_Ammo_CBU_105_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --CBU105
                    { CLSID = "Herc_Ammo_Mk_82_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, ---MK82
                    { CLSID = "Herc_Ammo_Mk_82AIR_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK82AIR
                    { CLSID = "Herc_Ammo_Mk_82Snake_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK82SNAKE
                    { CLSID = "Herc_Ammo_Mk_83_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK83
					{ CLSID = "Herc_Ammo_Mk_84_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK84
					{ CLSID = "Herc_Ammo_FAB100_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --FAB100
					{ CLSID = "Herc_Ammo_FAB250_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --FAB250
					{ CLSID = "Herc_Ammo_FAB500_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --FAB500
					{ CLSID = "Herc_Ammo_BETAB500_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --BETAB500
					{ CLSID = "Herc_Ammo_BETAB500SP_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --BETAB500SP
					{ CLSID = "Herc_Ammo_KAB500KR_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --KAB500KR
					{ CLSID = "Herc_Ammo_RBK250PTAB25M_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --RBK250PTAB25M
					{ CLSID = "Herc_Ammo_RBK500255PTAB105_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --RBK500255PTAB105
					{ CLSID = "Herc_Ammo_RBK500PTAB1M_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --RBK500PTAB1M
					{ CLSID = "Herc_Ammo_Herc_Ammo_M117_bombs_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --M117
					{ CLSID = "Herc_Ammo_KMGU296AO25RT_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --KMGU296AO25RT
					{ CLSID = "Herc_Ammo_KMGU296AO25KO_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --KMGU296AO25KO
					{ CLSID = "Herc_Ammo_MK20_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK20
					{ CLSID = "Herc_Ammo_SAB100_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --SAB100
					-----------------------------------------ROCKETS-----------------------------------------------------			
                    { CLSID = "Herc_Ammo_hydra_HE_rockets", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --HYDRA HE
					{ CLSID = "Herc_Ammo_hydra_WP_rockets", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --HYDRA WP
					--------------------------------------MISSLIES AA---------------------------------------------------------
                    { CLSID = "Herc_Ammo_AIM9M_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM9M
                    { CLSID = "Herc_Ammo_AIM9P5_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM9P5
                    { CLSID = "Herc_Ammo_AIM9X_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM9X
                    { CLSID = "Herc_Ammo_AIM7M_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM7M
                    { CLSID = "Herc_Ammo_AIM120B_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM120B
					{ CLSID = "Herc_Ammo_AIM120C_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM120C
					{ CLSID = "Herc_Ammo_R60M_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R60M
					{ CLSID = "Herc_Ammo_MAGIC2_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MAGIC2
					{ CLSID = "Herc_Ammo_R27R_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R27R
					{ CLSID = "Herc_Ammo_R27ER_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R27ER
					{ CLSID = "Herc_Ammo_R27T_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R27T
					{ CLSID = "Herc_Ammo_R27ET_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R27ET
					{ CLSID = "Herc_Ammo_R27_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R77
					{ CLSID = "Herc_Ammo_S530D_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --super530d
					{ CLSID = "Herc_Ammo_AIM54C_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM54
					------------------------------------------VEHICLES---------------------------------------------------
                    { CLSID = "Herc_APC_M1043_HMMWV_Armament", arg_value = 0.2, attach_point_position = { 0, 0, 0}},---3990kg Humvee
                    { CLSID = "Herc_ATGM_M1045_HMMWV_TOW", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --humvee tow
					{ CLSID = "Herc_AAA_Vulcan_M163", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, -- vulcan
					{ CLSID = "Herc_SPG_M1126_Stryker_ICV", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --stryker mg
                    { CLSID = "Herc_SPG_M1128_Stryker_MGS", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --stryker tank
                    { CLSID = "Herc_ATGM_M1134_Stryker", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --styker tow
                    { CLSID = "Herc_APC_LAV_25", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --lav25
					{ CLSID = "Herc_APC_M1025_HMMWV", arg_value = 0.2, attach_point_position = { 0, 0, 0}},	--humvee				
					{ CLSID = "Herc_SAM_M1097_HMMWV", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --avenger
					{ CLSID = "Herc_APC_COBRA", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --cobra
					{ CLSID = "Herc_APC_M113", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --m113
					{ CLSID = "Herc_HEMTT_Tanker", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --hemtt tanker
					{ CLSID = "Herc_HEMTT_FFT", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --hemtt
					{ CLSID = "Herc_IFV_M2A2_Bradley", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --bradley
					{ CLSID = "Herc_IFV_MCV80_Warrior", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, -- mcv80
					{ CLSID = "Herc_IFV_BMP_1", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --bmp 1
					{ CLSID = "Herc_IFV_BMP_2", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --bmp2
					{ CLSID = "Herc_IFV_BMP_3", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --bmp 3
					{ CLSID = "Herc_ARV_BRDM_2", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --brdm2
					{ CLSID = "Herc_APC_BTR_80", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --btr80
					{ CLSID = "Herc_SAM_ROLAND_ADS", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --roland
					{ CLSID = "Herc_SAM_ROLAND_LN", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --roland
					{ CLSID = "Herc_SAM_13", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --strela
					{ CLSID = "Herc_ZSU_23_4", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --shilka
					{ CLSID = "Herc_SAM_19", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --tungusta
					{ CLSID = "Herc_UAZ_469", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --UAZ-469
					{ CLSID = "Herc_URAL_375", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --ural 375
					{ CLSID = "Herc_M_818", arg_value = 0.2, attach_point_position = { 0, -0.99, 0}}, --m818
					{ CLSID = "Herc_TIGR_233036", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --tigr
					{ CLSID = "Herc_AAA_GEPARD", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --gepard
					{ CLSID = "Herc_SAM_CHAPARRAL", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --chaparal
					{ CLSID = "Herc_SAM_LINEBACKER", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --linebaker
					{ CLSID = "Herc_IFV_MARDER", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --marder
					{ CLSID = "Herc_IFV_TPZ", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --tpz
					{ CLSID = "Herc_IFV_BMD1", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --bmd1
					{ CLSID = "Herc_IFV_BTRD", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --btrd
					{ CLSID = "Herc_ART_NONA", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --nona
					{ CLSID = "Herc_ART_GVOZDIKA", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --gvozdika
					{ CLSID = "Herc_APC_MTLB", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --MTLB
					{ CLSID = "Herc_ART_M1A2", arg_value = 0.2, attach_point_position = { 0, -1.5, 0}}, --Abrams
					{ CLSID = "Herc_ART_M1A2_PALLATE", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --Abrams
					{ CLSID = "Herc_GEN_CRATE", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --Generic
            }
        ),
		pylon(11, 0, 0.0, 0.0, 0.0,
            {
  				arg = 321, arg_value = 0.0, connector = "CargoFWD", use_full_connector_position = true, DisplayName = "C-FWD"
			},
				{
                    ---------------------------------MISSILES AG-----------------------------------------------------
                    { CLSID = "Herc_Ammo_AGM_65D_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65D
                    { CLSID = "Herc_Ammo_AGM_65H_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65H
                    { CLSID = "Herc_Ammo_AGM_65G_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65G
                    { CLSID = "Herc_Ammo_AGM_65E_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65E
                    { CLSID = "Herc_Ammo_AGM_88C_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM88C
                    { CLSID = "Herc_Ammo_AGM_65K_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AGM65K
					{ CLSID = "Herc_Ammo_Vikhr_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----VIHKR					
					{ CLSID = "Herc_Ammo_AGM_84A_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----agm84a
					{ CLSID = "Herc_Ammo_AGM_84E_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----agm84e
					{ CLSID = "Herc_Ammo_KH25ML_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH25ML
					{ CLSID = "Herc_Ammo_KH25MPU_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH25MPU
					{ CLSID = "Herc_Ammo_KH29T_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH29T
					{ CLSID = "Herc_Ammo_KH29L_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH29L
					{ CLSID = "Herc_Ammo_KH58U_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----KH58U
					{ CLSID = "Herc_Ammo_S24B_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----S24B
					{ CLSID = "Herc_Ammo_S25OFM_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----S25OFM
					{ CLSID = "Herc_Ammo_S25L_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}},-----S25L
					---------------------------------------BOMBS-------------------------------------------------------------
                    { CLSID = "Herc_Ammo_GBU_10_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU10
                    { CLSID = "Herc_Ammo_GBU_12_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU12
                    { CLSID = "Herc_Ammo_GBU_16_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU16
                    { CLSID = "Herc_Ammo_GBU_31_VB_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU31V/B
                    { CLSID = "Herc_Ammo_GBU_31_V3B_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU31V3B
                    { CLSID = "Herc_Ammo_GBU_38_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --GBU38
                    { CLSID = "Herc_Ammo_CBU_87_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --CBU87
					{ CLSID = "Herc_Ammo_CBU_97_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --CBU97
                    { CLSID = "Herc_Ammo_CBU_103_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --CBU103
                    { CLSID = "Herc_Ammo_CBU_105_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --CBU105
                    { CLSID = "Herc_Ammo_Mk_82_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, ---MK82
                    { CLSID = "Herc_Ammo_Mk_82AIR_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK82AIR
                    { CLSID = "Herc_Ammo_Mk_82Snake_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK82SNAKE
                    { CLSID = "Herc_Ammo_Mk_83_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK83
					{ CLSID = "Herc_Ammo_Mk_84_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK84
					{ CLSID = "Herc_Ammo_FAB100_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --FAB100
					{ CLSID = "Herc_Ammo_FAB250_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --FAB250
					{ CLSID = "Herc_Ammo_FAB500_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --FAB500
					{ CLSID = "Herc_Ammo_BETAB500_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --BETAB500
					{ CLSID = "Herc_Ammo_BETAB500SP_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --BETAB500SP
					{ CLSID = "Herc_Ammo_KAB500KR_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --KAB500KR
					{ CLSID = "Herc_Ammo_RBK250PTAB25M_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --RBK250PTAB25M
					{ CLSID = "Herc_Ammo_RBK500255PTAB105_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --RBK500255PTAB105
					{ CLSID = "Herc_Ammo_RBK500PTAB1M_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --RBK500PTAB1M
					{ CLSID = "Herc_Ammo_Herc_Ammo_M117_bombs_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --M117
					{ CLSID = "Herc_Ammo_KMGU296AO25RT_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --KMGU296AO25RT
					{ CLSID = "Herc_Ammo_KMGU296AO25KO_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --KMGU296AO25KO
					{ CLSID = "Herc_Ammo_MK20_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MK20
					{ CLSID = "Herc_Ammo_SAB100_bombs", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --SAB100
					-----------------------------------------ROCKETS-----------------------------------------------------			
                    { CLSID = "Herc_Ammo_hydra_HE_rockets", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --HYDRA HE
					{ CLSID = "Herc_Ammo_hydra_WP_rockets", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --HYDRA WP
					--------------------------------------MISSLIES AA---------------------------------------------------------
                    { CLSID = "Herc_Ammo_AIM9M_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM9M
                    { CLSID = "Herc_Ammo_AIM9P5_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM9P5
                    { CLSID = "Herc_Ammo_AIM9X_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM9X
                    { CLSID = "Herc_Ammo_AIM7M_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM7M
                    { CLSID = "Herc_Ammo_AIM120B_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM120B
					{ CLSID = "Herc_Ammo_AIM120C_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM120C
					{ CLSID = "Herc_Ammo_R60M_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R60M
					{ CLSID = "Herc_Ammo_MAGIC2_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --MAGIC2
					{ CLSID = "Herc_Ammo_R27R_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R27R
					{ CLSID = "Herc_Ammo_R27ER_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R27ER
					{ CLSID = "Herc_Ammo_R27T_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R27T
					{ CLSID = "Herc_Ammo_R27ET_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R27ET
					{ CLSID = "Herc_Ammo_R27_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --R77
					{ CLSID = "Herc_Ammo_S530D_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --super530d
					{ CLSID = "Herc_Ammo_AIM54C_missiles", arg_value = 0.2, attach_point_position = { 0, -0.1, 0}}, --AIM54
					--------------------------------------------Vechicles--------------------------------------------------
					{ CLSID = "Herc_APC_M1043_HMMWV_Armament", arg_value = 0.2, attach_point_position = { 0, 0, 0}},---3990kg Humvee
					{ CLSID = "Herc_SPG_M1126_Stryker_ICV", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --stryker mg
                    { CLSID = "Herc_ATGM_M1045_HMMWV_TOW", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --humvee tow
					{ CLSID = "Herc_APC_M1025_HMMWV", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --humvee
					{ CLSID = "Herc_SAM_M1097_HMMWV", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --avenger
					{ CLSID = "Herc_APC_COBRA", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --cobra
					{ CLSID = "Herc_ARV_BRDM_2", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --brdm2
					{ CLSID = "Herc_AAA_Vulcan_M163", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --vulcan
					{ CLSID = "Herc_APC_LAV_25", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --lav25
					{ CLSID = "Herc_APC_M113", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --m113
					{ CLSID = "Herc_IFV_BMP_1", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --bmp1
					{ CLSID = "Herc_APC_BTR_80", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --bmp1				
					{ CLSID = "Herc_SAM_13", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --strela
					{ CLSID = "Herc_UAZ_469", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --UAZ-469					
					{ CLSID = "Herc_URAL_375", arg_value = 0.2, attach_point_position = { 0, -0.95, 0}}, --ural 375
																						 
					{ CLSID = "Herc_TIGR_233036", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --tigr
					{ CLSID = "Herc_SAM_CHAPARRAL", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --chaparal
					{ CLSID = "Herc_IFV_BMD1", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --bmd1
					{ CLSID = "Herc_IFV_BTRD", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --btrd
					{ CLSID = "Herc_ART_NONA", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --nona	
					{ CLSID = "Herc_APC_MTLB", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --MTLB
					{ CLSID = "Herc_ART_M1A2_PALLATE", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --Abrams
					{ CLSID = "Herc_GEN_CRATE", arg_value = 0.2, attach_point_position = { 0, 0, 0}}, --Generic
            }
        ),
		pylon(12, 0, 0.0, 0.0, 0.0,
            {
  				arg = 317, arg_value = 1.0, connector = "Battle_Station", use_full_connector_position = true, DisplayName = "BS"
			},
				{
					{ CLSID = "Herc_BattleStation", arg_value = 0.10,  attach_point_position = { 0.0, 0.0, 0.0} }, -- Battle_Station_Attachment
				}
        ),
    },
	
	Tasks = {
		aircraft_task(Transport),
		aircraft_task(CAS),
        aircraft_task(GroundAttack),
    },	
	DefaultTask = aircraft_task(Transport),
	Countries = {"Algeria","Australia","Austria","Belgium","Brazil","Bulgaria","Canada","Chile","China","Denmark","Egypt",
				 "France","Georgia","Greece","Honduras","India","Indonesia","Insurgents","Iran","Iraq","Israel","Italy",
				 "Japan","Jordan","Kuwait","Libya","Malaysia","Mexico","Morocco","The Netherlands","Norway","Oman",
                 "Pakistan","Philippines","Poland","Portugal","Romania","Russia","Saudi Arabia","South Africa","South Korea",
				 "Spain","Sudan","Sweden","Thailand","Tunisia","Turkey","United Arab Emirates","UK","USA","Venezuela","Yemen","USAF Aggressors",
				 "Combined Joint Task Forces Red","Combined Joint Task Forces Blue","United Nations Peacekeepers"},

	
	SFM_Data = {
		aerodynamics = -- Cx = Cx_0 + Cy^2*B2 +Cy^4*B4
		{
			Cy0		=	0.0,      -- zero AoA lift coefficient
			Mzalfa		=	6.6,  -- coefficients for pitch agility
			Mzalfadt	=	1,    -- coefficients for pitch agility
			kjx		=	2.85,    
			kjz		=	0.00125, 
			Czbe		=	-0.012, -- coefficient, along Z axis (perpendicular), affects yaw, negative value means force orientation in FC coordinate system
			cx_gear		=	0.015,    -- coefficient, drag, gear
			cx_flap		=	0.08,   -- coefficient, drag, full flaps
			cy_flap		=	1,    -- coefficient, normal force, lift, flaps
			cx_brk		=	0.06,   -- coefficient, drag, breaks
			table_data  = 
			{
				[1] = 	{0,	0.024,	0.1,	0.0384,	0.000001,	0.5,	11,	1.2},
				[2] = 	{0.2,	0.024,	0.1,	0.0384,	0.000001,	0.8,	12,	1.2},
				[3] = 	{0.4,	0.024,	0.1,	0.0384,	0.000001,	1.0,	13,	1.2},
				[4] = 	{0.5,	0.024,	0.1,	0.0384,	0.000001,	1.1,	14,	1.2},
				[5] = 	{0.6,	0.027,	0.1,	0.0,	0.3,		1.2,	15,	1.2},
				[6] = 	{0.7,	0.031,	0.1,	0.045,	0.9,		1.3,	16,	1},
				[7] = 	{0.8,	0.036,	0.1,	0.107,	1,		1.3,	15,	0.8},
				[8] = 	{0.9,	0.045,	0.1,	0.148,	0.058,		1.35,	10,	0.6},
				[9] = 	{1,	0.054,	0.1,	0.199,	0.1,		1.4,	7,	0.53333333333333},
				[10] = 	{1.5,	0.054,	0.1,	0.199,	0.1,		1.5,	3,	0.2},
			}, -- end of table_data
			-- M - Mach number
			-- Cx0 - Coefficient, drag, profile, of the airplane
			-- Cya - Normal force coefficient of the wing and body of the aircraft in the normal direction to that of flight. Inversely proportional to the available G-loading at any Mach value. (lower the Cya value, higher G available) per 1 degree AOA
			-- B - Polar quad coeff
			-- B4 - Polar 4th power coeff
			-- Omxmax - roll rate, rad/s
			-- Aldop - Alfadop Max AOA at current M - departure threshold
			-- Cymax - Coefficient, lift, maximum possible (ignores other calculations if current Cy > Cymax)
		}, -- end of aerodynamics
		engine = 
		{
			Nmg	=	67.5, -- RPM at idle
			MinRUD	=	0, -- Min state of the throttle
			MaxRUD	=	1, -- Max state of the throttle
			MaksRUD	=	1, -- Military power state of the throttle
			ForsRUD	=	1, -- Afterburner state of the throttle
			typeng	=	3,
			--[[
				E_TURBOJET = 0
				E_TURBOJET_AB = 1
				E_PISTON = 2
				E_TURBOPROP = 3
				E_TURBOFAN = 4
				E_TURBOSHAFT = 5
			--]]
			
			hMaxEng	=	19.5, -- Max altitude for safe engine operation in km
			dcx_eng	=	0.0144,--0.0085, -- Engine drag coeficient
			cemax	=	1.24, -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			cefor	=	0.37, -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			dpdh_m	=  6600,	--4820, --  altitude coefficient for max thrust
			dpdh_f	= 13200,	--4820,  --  altitude coefficient for AB thrust
			table_data = 
			{		--   M		Pmax		 Pfor	
				[1] = 	{0.0,	150792},
				[2] = 	{0.1,	148288},
				[3] = 	{0.2,	523532},
				[4] = 	{0.3,	503802},
				[5] = 	{0.4,	387547},
				[6] = 	{0.5,	371709},
				[7] = 	{0.6,	358459},
				[8] = 	{0.7,	348624},
				[9] = 	{0.8,	341439},
				[10] = 	{0.9,	333000},






				}, -- end of table_data
			-- M - Mach number
			-- Pmax - Engine thrust at military power
			-- Pfor - Engine thrust at AFB
		}, -- end of engine
	},
	
    -- effects_presets = {		
		-- {effect = "OVERWING_VAPOR", file = current_mod_path.."/Effects/M-2000C_overwingVapor.lua"},
	-- },

	fires_pos =  -- depreciate with X-Ray
		{
			[1] = 	{-9.41 -4.66, 1.85 -0.34, 0.0},		-- Fuselage					10 - fuselage right
			[2] = 	{-9.41 + 1.77,	1.85 -0.29, 5.305},	-- Wing inner Right
			[3] = 	{-9.41 + 1.77,	1.85 -0.29, -5.305},	-- Wing inner Left
			[4] = 	{-9.41 + 2.034,	1.85 -0.047, 10.73},	-- Wing middle Right
			[5] = 	{-9.41 + 2.034,	1.85 -0.047, -10.73},	-- Wing middle Left
			[6] = 	{-9.41 + 0.08, 1.85 +0.59, 14.82}, -- Wing outer Right
			[7] = 	{-9.41 + 0.08, 1.85 +0.59, -14.82},	-- Wing outer Left
			[8] = 	{-9.41 + 0.08, 1.85 -1.037, 8.038},		-- Engine (inner Right)
			[9] = 	{-9.41 + 0.08, 1.85 -1.037, -8.038},		-- Engine (inner Left)
			[10] = 	{10,	2.5,	15},  --Hull right
			[11] = 	{10,	2.5,	-15},  --Hull left
		}, -- end of fires_pos
	
			-- deps_cells = {00, 00, 00, 00, 00, 00, 00},
	Damage = verbose_to_dmg_properties({
---------------------------------------------------------Collision lines
		["Line_NOSE"] =
		{
			args = {146},--, 81, 224, 214,223, 213
			critical_damage	= 20,
			-- deps_cells = {55, 47, 51, 52, 48, 40, 53},
		},
		["Line_MAIN"] =
		{
			args = {153},
			-- critical_damage	= 3,
		},
		["Line_WING_L"] = --remove WING_L_CENTER
		{
			args = {225},
			critical_damage	= 50,
			deps_cells = {"WING_L_OUT", "AILERON_L", "WING_L_CENTER", "FLAP_L_OUT", "ENGINE_L"},--(Engine 1)
		},
		-- ["Line_WING_R"] = --remove WING_R_CENTER
		-- {
			-- args = {215},
			-- critical_damage	= 10,--50
			-- deps_cells = {"WING_R_OUT", "AILERON_R", "WING_R_CENTER", "FLAP_R_OUT", "ENGINE_R"},--(Engine 4)
		-- },
		["Line_WING_R"] = --remove WING_R_CENTER
		{
			args = {213},
			critical_damage	= 1,--50
			deps_cells = {"WING_R_OUT"},--(Engine 4)
		},
		["Line_KIL_L"] =
		{
			args = {234},
			critical_damage	= 20,
		},
		-- ["Line_KIL_R"] =
		-- {
			-- args = {81},--242, 146, 81
			-- critical_damage	= 20,
		-- },
		-- ["Line_STABIL_L"] = --Used for removing tail section
		-- {
			-- args = {236, 81},
			-- critical_damage	= 50,
			-- deps_cells = {"TAIL", "STABILIZER_R_OUT", "ELEVATOR_R", "Line_STABIL_L", "STABILIZER_L_OUT", "ELEVATOR_L", "RUDDER_R", "RUDDER"},
		-- },
		["Line_STABIL_R"] = --Used for removing cargo door
		{
			args = {234},
			critical_damage	= 1,
			-- deps_cells = {"TAIL_BOTTOM"},--(Engine 4)
		},
---------------------------------------------------------Engines
		["ENGINE_L"] = --(Engine 1)
		{
			args = {167},
			critical_damage	= 3,
		},
		["MTG_L_BOTTOM"] = --(Engine 2)
		{
			args = {169},
			critical_damage	= 3,
		},
		["MTG_R_BOTTOM"] = --(Engine 3)
		{
			args = {163},
			critical_damage	= 3,
		},
		["ENGINE_R"] = --(Engine 4)
		{
			args = {161},
			critical_damage	= 3,
		},
---------------------------------------------------------Fuselage
		["NOSE_CENTER"] =
		{
			args = {146},--, 81, 224, 214,223, 213
			critical_damage	= 20,
			-- deps_cells = {55, 47, 51, 52, 48, 40, 53},
			droppable = true,
			droppable_shape = "Hercules_NoseCone",
		},
		["COCKPIT"] =
		{
			args = {65},
			critical_damage	= 20,
		},
		["FUSELAGE_LEFT_SIDE"] =
		{
			args = {154},
			critical_damage	= 3,
		},
		["FUSELAGE_RIGHT_SIDE"] =
		{
			args = {153},
			-- critical_damage	= 3,
		},
		["KEEL_L"] = --Left main gear housing
		{
			args = {586},
			critical_damage	= 6,
		},
		["KEEL_R"] = --Right main gear housing
		{
			args = {587},
			critical_damage	= 6,
		},
---------------------------------------------------------Left Wing
		["WING_L_OUT"] =
		{
			args = {223},
			critical_damage	= 8,
			deps_cells = {"AILERON_L"},
		},
		["AILERON_L"] =
		{
			args = {226},
			critical_damage	= 3,
		},
		["WING_L_CENTER"] =
		{
			args = {224},
			critical_damage	= 50,
			deps_cells = {"WING_L_OUT", "AILERON_L", "FLAP_L_OUT", "ENGINE_L"},--(Engine 1)
			droppable = true,
			droppable_shape = "Hercules_leftWing",
		},
		["FLAP_L_OUT"] =
		{
			args = {227},
			critical_damage	= 4,
		},
		["WING_L_IN"] =
		{
			args = {225},
			critical_damage	= 4,
		},
		["FLAP_L_IN"] =
		{
			args = {228},
			critical_damage	= 3,
		},
---------------------------------------------------------Right Wing
		["WING_R_OUT"] =
		{
			args = {213},
			critical_damage	= 1,
			-- deps_cells = {"AILERON_R"},
		},
		["AILERON_R"] =
		{
			args = {216},
			critical_damage	= 1,
		},
		["WING_R_CENTER"] =
		{
			args = {214},
			critical_damage	= 1,--50
			-- deps_cells = {"WING_R_OUT", "AILERON_R", "FLAP_R_OUT", "ENGINE_R"},--(Engine 4)
			droppable = true,
			droppable_shape = "Hercules_RightWing",
		},
		["FLAP_R_OUT"] =
		{
			args = {217},
			critical_damage	= 4,
		},
		["WING_R_IN"] =
		{
			args = {215},
			critical_damage	= 4,
		},
		["FLAP_R_IN"] =
		{
			args = {218},
			critical_damage	= 3,
		},
---------------------------------------------------------Tail
		-- ["TAIL"] =
		-- {
			-- args = {81},
			-- critical_damage	= 50,
			-- deps_cells = {"STABILIZER_R_OUT", "ELEVATOR_R", "STABILIZER_L_OUT", "ELEVATOR_L", "RUDDER_R", "RUDDER"},
			-- droppable = true,
			-- droppable_shape = "Hercules_TailSection",
		-- },
		["TAIL_LEFT_SIDE"] =
		{
			args = {158},
			critical_damage	= 5,
		},
		["TAIL_RIGHT_SIDE"] =
		{
			args = {157},
			critical_damage	= 5,
		},
		["RUDDER_R"] = --Vert stabilizer
		{
			args = {247},--241, 146, 81
			critical_damage	= 25,
			deps_cells = {"RUDDER"},
		},
		["RUDDER"] =
		{
			args = {248},
			critical_damage	= 5,
		},
		["STABILIZER_L_OUT"] =
		{
			args = {235},
			critical_damage	= 25,
			deps_cells = {"ELEVATOR_L"},
		},
		["ELEVATOR_L"] =
		{
			args = {240},
			critical_damage	= 5,
		},
		["STABILIZER_R_OUT"] =
		{
			args = {233},
			critical_damage	= 25,
			deps_cells = {"ELEVATOR_R"},
		},
		["ELEVATOR_R"] =
		{
			args = {238},
			critical_damage	= 5,
		},
		["TAIL_BOTTOM"] = --Cargo door
		{
			args = {156},--241, 146, 81
			critical_damage	= 5,
			droppable = true,
			droppable_shape = "Hercules_CargoDoor",
		},
---------------------------------------------------------Wheels
		["WHEEL_F"] =
		{
			args = {134},
			critical_damage	= 3,
		},
		["WHEEL_L"] =
		{
			args = {136},
			critical_damage	= 3,
		},
		["WHEEL_R"] =
		{
			args = {135},
			critical_damage	= 3,
		},
	}),-- end of Damage
	
	DamageParts = 
	{  
		-- [1] = "C-130-OBLOMOK-WING-R",
		-- [2] = "C-130-OBLOMOK-WING-L",
		[1000 + 0] = "Hercules_NoseCone",
		-- [1000 + 29] = "Hercules_leftWingCentre",
		-- [1000 + 24] = "Hercules_RightWingCentre",
		-- [1000 + 30] = "Hercules_RightWingCentre",
		[1000 + 35] = "Hercules_leftWing",
		[1000 + 36] = "Hercules_RightWing",
		[1000 + 48] = "Hercules_CargoDoor",
		[1000 + 55] = "Hercules_TailSection",
		[1000 + 43] = "Hercules_CargoDoor",
		[1000 + 44] = "Hercules_TailSection",
		[1000 + 47] = "Hercules_TailSection",
	},
	
	Failures = {
	},
	
	lights_data = 	{
		typename = "collection",
		lights = 	{
			--[[HOVER Light]]--
			[1] = {
				typename = "collection",
				lights ={
					{typename = "argumentlight", argument = 209, dir_correction = {elevation = math.rad(3)}, speed = 1.0},
				}
			},
			
			--[[APPROACH Lights]]--
			[2] = {
				typename = "collection",
				lights ={
					{typename = "argumentlight", argument = 208, dir_correction = {elevation = math.rad(3)}, speed = 1.0},
				}
			},
			
			--[[AUX LIGHTS]]--
			[3] = {
				typename = "collection",
				lights ={
					{typename = "argumentlight", connector = "CTN_AUX", color = {0.99, 0.99, 0.99}, pos_correction  = {0, 0, 0.0}, argument  = 905, speed = 1.0}, -- Police
				}
			},	
			
			--[ANTI-COLLISION :: [NATO STROBE LIGHTS]]--
			[4] = {
				typename = "collection",
				lights ={
					{typename = "natostrobelight", connector = "TOP_BEACON",    argument_1 = 83,  period = 1.333, color = {0.99, 0.00, 0.00}, phase_shift = 0.0},
					{typename = "natostrobelight", connector = "BOTTOM_BEACON", argument_1 = 802, period = 1.333, color = {0.99, 0.00, 0.00}, phase_shift = 0.5},
				}
			},
			
			--[POSITION :: [NAVIGATION LIGHTS]]--
			[5] = {
				typename = "collection",
				lights ={
					{typename = "argumentlight", connector = "LIGHT_NAV_RED",   color = {0.99, 0.11, 0.3},  pos_correction  = {0, 0, 0.0}, argument  = 190},
					{typename = "argumentlight", connector = "LIGHT_NAV_GREEN", color = {0.11, 0.99, 0.3},  pos_correction  = {0, 0, 0.0}, argument  = 191},
					{typename = "argumentlight", connector = "LIGHT_NAV_WHITE", color = {0.99, 0.99, 0.99}, pos_correction  = {0, 0, 0.0}, argument  = 192},
				}
			},
			
			--[FORMATION :: [FORMATION LIGHTS]]--
			[6] = {
				typename = "collection",
				lights ={
					{typename = "argumentlight",argument = 200}, -- form front
					{typename = "argumentlight",argument = 201}, -- form aft
				}
			},	
			
			--[AIR REFUELING PROBE :: [REFUEL LIGHTS]]--
			[7] = {
				typename = "collection",
				lights ={
					{typename = "argumentlight", connector = "CNT_RF1", color = {0.99, 0.99, 0.99}, pos_correction  = {0, 0, 0.0}, argument  = 903}, -- Right Side Low
				}
			},	
			
			--[WIND VANE :: [EXTERNAL LIGHTS]]--
			[8] = {
				typename = "collection",
				lights ={
					{typename = "argumentlight", connector = "CNT_WV", color = {0.99, 0.99, 0.99}, pos_correction  = {0, 0, 0.0}, argument  = 904}, -- Nose Low
				}
			},	
		},
	},
	-- end lights_data
	
	-- AddPropAircraft = {
		-- {id = "SoloFlight", control = 'checkbox' , label = _('Solo Flight'), defValue = false, weightWhenOn = -80},
		-- {id = "NetCrewControlPriority" , control = 'comboList', label = _('Aircraft Control Priority'), playerOnly = true,
		  -- values = {{id =  0, dispName = _("Pilot")},
					-- {id =  1, dispName = _("Instructor")},
					-- {id = -1, dispName = _("Ask Always")},
					-- {id = -2, dispName = _("Equally Responsible")}},
		  -- defValue  = 1,
		  -- wCtrl     = 150
		-- },
	-- },

	
	-- ViewSettings = ViewSettings,
	-- SnapViews	 = SnapViews,
	
}

add_aircraft(Hercules)
