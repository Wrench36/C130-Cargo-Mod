--for testing
myLog = mist.Logger:new('HarculesCargo')
myLog:msg('loading HarculesCargo_Custom_Cirlce')
-- Hercules Cargo Drop Events by Anubis Yinepu

-- This script will only work for the Herculus mod by Anubis
-- Payloads carried by pylons 11, 12 and 13 need to be declared in the Herculus_Loadout.lua file
-- Except for Ammo pallets, this script will spawn whatever payload gets launched from pylons 11, 12 and 13
-- Pylons 11, 12 and 13 are moveable within the Herculus cargobay area
-- Ammo pallets can only be jettisoned from these pylons with no benefit to DCS world
-- To benefit DCS world, Ammo pallets need to be off/on loaded using DCS arming and refueling window
-- Cargo_Container_Enclosed = true: Cargo enclosed in container with parachute, need to be dropped from 100m (300ft) or more, except when parked on ground
-- Cargo_Container_Enclosed = false: Open cargo with no parachute, need to be dropped from 10m (30ft) or less

Hercules_Cargo = {}
Hercules_Cargo.Hercules_Cargo_Drop_Events = {}
Hercules_Cargo.carrierGroups = {}
local GT_DisplayName = ""
local GT_Name = ""
local Cargo_Drop_initiator = ""
local Cargo_Container_Enclosed = false

local j = 0
local Cargo = {}
Cargo.Cargo_Drop_Direction = 0
Cargo.Cargo_Contents = ""
Cargo.Cargo_Type_name = ""
Cargo.Cargo_over_water = false
Cargo.Container_Enclosed = false
Cargo.offload_cargo = false
Cargo.all_cargo_survive_to_the_ground = false
Cargo.all_cargo_gets_destroyed = false
Cargo.destroy_cargo_dropped_without_parachute = false
Cargo.scheduleFunctionID = 0

local CargoHeading = 0
local Cargo_Drop_Position = {}

local CargoUnitID = 0
local CargoGroupID = 0
local CargoStaticGroupID = 0

Hercules_Cargo.types = {
	["ATGM M1045 HMMWV TOW [7183lb]"] = {['name'] = "M1045 HMMWV TOW", ['container'] = true},
	["APC M1043 HMMWV Armament [7023lb]"] = {['name'] =  "M1043 HMMWV Armament", ['container'] = true},
	["SAM Avenger M1097 [7200lb]"] = {['name'] =  "M1097 Avenger", ['container'] = true},
	["APC Cobra [10912lb]"] = {['name'] =  "Cobra", ['container'] = true},
	["APC M113 [21624lb]"] = {['name'] =  "M-113", ['container'] = true},
	["Tanker M978 HEMTT [34000lb]"] = {['name'] =  "M978 HEMTT Tanker", ['container'] = false},
	["HEMTT TFFT [34400lb]"] = {['name'] =  "HEMTT TFFT", ['container'] = false},
	["SPG M1128 Stryker MGS [33036lb]"] = {['name'] =  "M1128 Stryker MGS", ['container'] = false},
	["AAA Vulcan M163 [21666lb]"] = {['name'] =  "Vulcan", ['container'] = true},
	["APC M1126 Stryker ICV [29542lb]"] = {['name'] =  "M1126 Stryker ICV", ['container'] = false},
	["ATGM M1134 Stryker [30337lb]"] = {['name'] =  "M1134 Stryker ATGM", ['container'] = false},
	["APC LAV-25 [22514lb]"] = {['name'] =  "LAV-25", ['container'] = true},
	["M1025 HMMWV [6160lb]"] = {['name'] =  "Hummer", ['container'] = true},
	["IFV M2A2 Bradley [34720lb]"] = {['name'] =  "M-2 Bradley", ['container'] = false},
	["IFV MCV-80 [34720lb]"] = {['name'] =  "MCV-80", ['container'] = false},
	["IFV BMP-1 [23232lb]"] = {['name'] =  "BMP-1", ['container'] = false},
	["IFV BMP-2 [25168lb]"] = {['name'] =  "BMP-2", ['container'] = false},
	["IFV BMP-3 [32912lb]"] = {['name'] =  "BMP-3", ['container'] = false},
	["ARV BRDM-2 [12320lb]"] = {['name'] =  "BRDM-2", ['container'] = true},
	["APC BTR-80 [23936lb]"] = {['name'] =  "BTR-80", ['container'] = true},
	["SAM ROLAND ADS [34720lb]"] = {['name'] =  "Roland Radar", ['container'] = false},
	["SAM ROLAND LN [34720b]"] = {['name'] =  "Roland ADS", ['container'] = false},
	["SAM SA-13 STRELA [21624lb]"] = {['name'] =  "Strela-10M3", ['container'] = false},
	["AAA ZSU-23-4 Shilka [32912lb]"] = {['name'] =  "ZSU-23-4 Shilka", ['container'] = false},
	["SAM SA-19 Tunguska 2S6 [34720lb]"] = {['name'] =  "2S6 Tunguska", ['container'] = false},
	["Transport UAZ-469 [3747lb]"] = {['name'] =  "UAZ-469", ['container'] = true},
	["Armed speedboat [2000lb]"] = {['name'] =  "speedboat", ['container'] = true},
	["AAA GEPARD [34720lb]"] = {['name'] =  "Gepard", ['container'] = false},
	["SAM CHAPARRAL [21624lb]"] = {['name'] =  "M48 Chaparral", ['container'] = true},
	["SAM LINEBACKER [34720lb]"] = {['name'] =  "M6 Linebacker", ['container'] = true},
	["Transport URAL-375 [14815lb]"] = {['name'] =  "Ural-375", ['container'] = true},
	["Transport M818 [16000lb]"] = {['name'] =  "M 818", ['container'] = true},
	["IFV MARDER [34720lb]"] = {['name'] =  "Marder", ['container'] = false},
	["Transport Tigr [15900lb]"] = {['name'] =  "Tigr_233036", ['container'] = true},
	["IFV TPZ FUCH [33440lb]"] = {['name'] =  "TPZ", ['container'] = false},
	["IFV BMD-1 [18040lb]"] = {['name'] =  "BMD-1", ['container'] = true},
	["IFV BTR-D [18040lb]"] = {['name'] =  "BTR_D", ['container'] = true},
	["EWR SBORKA [21624lb]"] = {['name'] =  "Dog Ear radar", ['container'] = true},
	["ART 2S9 NONA [19140lb]"] = {['name'] =  "SAU 2-C9", ['container'] = true},
	["ART GVOZDIKA [34720lb]"] = {['name'] =  "SAU Gvozdika", ['container'] = false},
	["APC MTLB [26000lb]"] = {['name'] =  "MTLB", ['container'] = true},
	["MBT M1A2 [67600lb]"] = {['name'] =  "M-1 Abrams", ['container'] = false},
	["Pallate M1A2 [67600lb]"] = {['name'] =  "M-1 Abrams", ['container'] = true},
	["Generic Crate [20000lb]"] = {['name'] =  "Hercules_Container_Parachute", ['container'] = true}
}

--added by wrench
hercCargoMenu = missionCommands.addSubMenu('CargoTypes' , nil)
--[[
	local hercCargoType = '2B11 mortar'
	local hercCargoNum = 8
	missionCommands.addCommand('Howitzer', hercCargoMenu, function() hercCargoType = '2A18M' hercCargoNum = 3 end,nil)
	missionCommands.addCommand('Mortar', hercCargoMenu, function() hercCargoType = '2B11 mortar' hercCargoNum = 8 end,nil)
	missionCommands.addCommand('M-1 Abrams', hercCargoMenu, function() hercCargoType = 'M-1 Abrams' hercCargoNum = 1 end,nil)
	missionCommands.addCommand('MLRS', hercCargoMenu, function() hercCargoType = 'MLRS' hercCargoNum = 1 end,nil)
	missionCommands.addCommand('M-109', hercCargoMenu, function() hercCargoType = 'M-109' hercCargoNum = 1 end,nil)
	missionCommands.addCommand('FOB Crate', hercCargoMenu, function() hercCargoType = 'konteiner_red1' hercCargoNum = 1 end,nil)
]]
--end of wrench

function Hercules_Cargo.Cargo_SpawnGroup(Cargo_Drop_initiator, Cargo_Drop_Position, Cargo_Type_name, CargoHeading, Cargo_Country)
	myLog:msg('Cargo_SpawnGroup')
	Cargo_Drop_initiator = Cargo_Drop_initiator:getGroup()
	CargoUnitID = CargoUnitID + 1
	CargoGroupID = CargoGroupID + 1
	--added by wrench
	local genericBool = false
	if Cargo_Type_name == "Hercules_Container_Parachute" then
		myLog:msg('generic spawn')
		genericBool = true
		for i=1,#Hercules_Cargo.carrierGroups do
			if Hercules_Cargo.carrierGroups[i]['object'] == Cargo_Drop_initiator then
				Cargo_Type_name = Hercules_Cargo.carrierGroups[i]['cargoType']
				hercCargoNum = Hercules_Cargo.carrierGroups[i]['cargoNum']
			end
		end
	end
	--end of wrench
	local Cargo = 
	{
		["visible"] = false,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["groupId"] = CargoGroupID,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["type"] = Cargo_Type_name,
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["unitId"] = CargoUnitID,
				["skill"] = "Excellent",
				["y"] = Cargo_Drop_Position.z,
				["x"] = Cargo_Drop_Position.x,
				["name"] = "Cargo Unit "..CargoUnitID,
				["heading"] = CargoHeading,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = Cargo_Drop_Position.z,
		["x"] = Cargo_Drop_Position.x,
		["name"] = "Cargo Group "..CargoUnitID,
		["start_time"] = 0,
	}
	--added by wrench
	if genericBool then
		local points = Hercules_Cargo.makeCirlce({["y"] = Cargo_Drop_Position.z, ["x"] = Cargo_Drop_Position.x},hercCargoNum)
		for i=1,hercCargoNum do
			CargoUnitID = CargoUnitID + 1
			Cargo["units"][i] = {}
			Cargo["units"][i]["type"] = Cargo_Type_name
			Cargo["units"][i]["transportable"] = 
				{
					["randomTransportable"] = false,
				}
			Cargo["units"][i]["unitId"] = CargoUnitID
			Cargo["units"][i]["skill"] = "Excellent"
			Cargo["units"][i]["y"] = points[i].y
			Cargo["units"][i]["x"] = points[i].x
			Cargo["units"][i]["name"] = "Cargo Unit "..CargoUnitID
			Cargo["units"][i]["heading"] = CargoHeading
			Cargo["units"][i]["playerCanDrive"] = true
		end
		if Cargo_Type_name == 'konteiner_red1' then
			ctld.spawnFOBCrateStatic(Cargo_Country, nil, Cargo_Drop_Position, Cargo["units"][1]["name"])
			ctld.droppedFOBCratesBLUE[Cargo["units"][1]["name"]] = Cargo["units"][1]["name"]
			return false
		end
	end
	--end of wrench
	
	coalition.addGroup(Cargo_Country, Group.Category.GROUND, Cargo)
end

function Hercules_Cargo.makeCirlce(pos,number)
	local points = {}
	local threeSixty = math.pi*2
	local radEach = threeSixty / (number)
	local dirRad = 0
	trigger.action.markToAll(1, 'pos', mist.utils.makeVec3(pos , 0 ) , false, 'pos')
	local markNum = 2
	for i=1,number do
		points[i] = {}
		points[i]['x'] = ((math.cos(dirRad) * 10) + pos.x)
		points[i]['y'] = ((math.sin(dirRad) * 10) + pos.y)
		dirRad = dirRad + radEach
		trigger.action.markToAll(markNum, i, mist.utils.makeVec3(points[i] , 0 ) , false, i)
		markNum = markNum + 1
	end
	return points
end

function Hercules_Cargo.Cargo_SpawnStatic(Cargo_Drop_initiator, Cargo_Drop_Position, Cargo_Type_name, CargoHeading, dead, Cargo_Country)
	myLog:msg('Cargo_SpawnStatic')
	--added by wrench
	local genericBool = false
	if Cargo_Type_name == "Hercules_Container_Parachute" then
		myLog:msg('generic spawn')
		genericBool = true
		for i=1,#Hercules_Cargo.carrierGroups do
			if Hercules_Cargo.carrierGroups[i]['object'] == Cargo_Drop_initiator then
				Cargo_Type_name = Hercules_Cargo.carrierGroups[i]['cargoType']
				hercCargoNum = Hercules_Cargo.carrierGroups[i]['cargoNum']
			end
		end
	end
	--end of wrench
	CargoStaticGroupID = CargoStaticGroupID + 1
	local CargoObject = 
	{
		["type"] = Cargo_Type_name,
		["y"] = Cargo_Drop_Position.z,
		["x"] = Cargo_Drop_Position.x,
		["name"] = "Cargo Static Group "..CargoStaticGroupID,
		["heading"] = CargoHeading,
		["dead"] = dead,
	}
	--added by wrench
	if genericBool then
		local CargoObjects = {}
		local offset = 0
		for i=1,hercCargoNum do
			CargoObjects[i] = 
			{
				["type"] = Cargo_Type_name,
				["y"] = Cargo_Drop_Position.z + offset,
				["x"] = Cargo_Drop_Position.x + offset,
				["name"] = "Cargo Static Group "..CargoStaticGroupID,
				["heading"] = CargoHeading,
				["dead"] = false,
			}
			CargoStaticGroupID = CargoStaticGroupID + 1
			offset = offset + 10
		end
		if Cargo_Type_name == 'konteiner_red1' then
			ctld.spawnFOBCrateStatic(Cargo_Country, nil, Cargo_Drop_Position, CargoObjects[1]['name'])
			ctld.droppedFOBCratesBLUE[CargoObjects[1]['name']] = CargoObjects[1]['name']
			return false
		end
		for i = 1, #CargoObjects do
			coalition.addStaticObject(Cargo_Country, CargoObjects[i])
			return false
		end
	end
	--end of wrench
	
	coalition.addStaticObject(Cargo_Country, CargoObject)
end

function Hercules_Cargo.Cargo_SpawnObjects(Cargo_Drop_initiator,Cargo_Drop_Direction, Cargo_Content_position, Cargo_Type_name, Cargo_over_water, Container_Enclosed, offload_cargo, all_cargo_survive_to_the_ground, all_cargo_gets_destroyed, destroy_cargo_dropped_without_parachute, Cargo_Country)
	myLog:msg('spawnObjects')
	myLog:msg(Cargo_Drop_initiator)
	if offload_cargo == true then
		------------------------------------------------------------------------------
		if CargoHeading >= 3.14 then
			CargoHeading = 0
			Cargo_Drop_Position = {["x"] = Cargo_Content_position.x - (30.0 * math.cos(Cargo_Drop_Direction - 1.0)),
								   ["z"] = Cargo_Content_position.z - (30.0 * math.sin(Cargo_Drop_Direction - 1.0))}
		else
			if CargoHeading >= 1.57 then
				CargoHeading = 3.14
				Cargo_Drop_Position = {["x"] = Cargo_Content_position.x - (20.0 * math.cos(Cargo_Drop_Direction + 0.5)),
									   ["z"] = Cargo_Content_position.z - (20.0 * math.sin(Cargo_Drop_Direction + 0.5))}
			else
				if CargoHeading >= 0 then
					CargoHeading = 1.57
					Cargo_Drop_Position = {["x"] = Cargo_Content_position.x - (10.0 * math.cos(Cargo_Drop_Direction + 1.5)),
										   ["z"] = Cargo_Content_position.z - (10.0 * math.sin(Cargo_Drop_Direction + 1.5))}
				end
			end
		end
		------------------------------------------------------------------------------
		Hercules_Cargo.Cargo_SpawnGroup(Cargo_Drop_initiator, Cargo_Drop_Position, Cargo_Type_name, CargoHeading, Cargo_Country)
	else
		------------------------------------------------------------------------------
		CargoHeading = 0
		Cargo_Drop_Position = {["x"] = Cargo_Content_position.x - (20.0 * math.cos(Cargo_Drop_Direction)),
							   ["z"] = Cargo_Content_position.z - (20.0 * math.cos(Cargo_Drop_Direction))}
		------------------------------------------------------------------------------
		if all_cargo_gets_destroyed == true or Cargo_over_water == true then
			if Container_Enclosed == true then
				Hercules_Cargo.Cargo_SpawnStatic(Cargo_Drop_initiator, Cargo_Drop_Position, Cargo_Type_name, CargoHeading, true, Cargo_Country)
				Hercules_Cargo.Cargo_SpawnStatic(Cargo_Drop_initiator, Cargo_Drop_Position, "Hercules_Container_Parachute_Static", CargoHeading, true, Cargo_Country)
			else
				Hercules_Cargo.Cargo_SpawnStatic(Cargo_Drop_initiator, Cargo_Drop_Position, Cargo_Type_name, CargoHeading, true, Cargo_Country)
			end
		else
			------------------------------------------------------------------------------
			if all_cargo_survive_to_the_ground == true then
				Hercules_Cargo.Cargo_SpawnGroup(Cargo_Drop_initiator, Cargo_Drop_Position, Cargo_Type_name, CargoHeading, Cargo_Country)
				if Container_Enclosed == true then
					Hercules_Cargo.Cargo_SpawnStatic({["z"] = Cargo_Drop_Position.z + 10.0,["x"] = Cargo_Drop_Position.x + 10.0}, "Hercules_Container_Parachute_Static", CargoHeading, false, Cargo_Country)
				end
			end
			------------------------------------------------------------------------------
			if destroy_cargo_dropped_without_parachute == true then
				if Container_Enclosed == true then
					Hercules_Cargo.Cargo_SpawnGroup(Cargo_Drop_initiator, Cargo_Drop_Position, Cargo_Type_name, CargoHeading, Cargo_Country)
					Hercules_Cargo.Cargo_SpawnStatic({["z"] = Cargo_Drop_Position.z + 10.0,["x"] = Cargo_Drop_Position.x + 10.0}, "Hercules_Container_Parachute_Static", CargoHeading, false, Cargo_Country)
				else
					Hercules_Cargo.Cargo_SpawnStatic(Cargo_Drop_initiator, Cargo_Drop_Position, Cargo_Type_name, CargoHeading, true, Cargo_Country)
				end
			end
			------------------------------------------------------------------------------
		end
	end
end

function Hercules_Cargo.Calculate_Object_Height_AGL(object)
	return object:getPosition().p.y - land.getHeight({x = object:getPosition().p.x, y = object:getPosition().p.z})
end

function Hercules_Cargo.Check_SurfaceType(object)
   -- LAND,--1 SHALLOW_WATER,--2 WATER,--3 ROAD,--4 RUNWAY--5
	return land.getSurfaceType({x = object:getPosition().p.x, y = object:getPosition().p.z})
end

function Hercules_Cargo.Cargo_Track(Arg,time)
	myLog:msg('Cargo_Track')
	Cargo_Drop_initiator = Arg[2]
	local status, result = pcall(
		function()
		local next = next
		if next(Arg[1].Cargo_Contents) ~= nil then
			if Hercules_Cargo.Calculate_Object_Height_AGL(Arg[1].Cargo_Contents) < 5.0 then--pallet less than 5m above ground before spawning
				if Hercules_Cargo.Check_SurfaceType(Arg[1].Cargo_Contents) == 2 or Hercules_Cargo.Check_SurfaceType(Arg[1].Cargo_Contents) == 3 then
					Arg[1].Cargo_over_water = true--pallets gets destroyed in water
				end
				Arg[1].Cargo_Contents:destroy()--remove pallet+parachute before hitting ground and replace with Cargo_SpawnContents
				Hercules_Cargo.Cargo_SpawnObjects(Cargo_Drop_initiator, Arg[1].Cargo_Drop_Direction, Object.getPoint(Arg[1].Cargo_Contents), Arg[1].Cargo_Type_name, Arg[1].Cargo_over_water, Arg[1].Container_Enclosed, Arg[1].offload_cargo, Arg[1].all_cargo_survive_to_the_ground, Arg[1].all_cargo_gets_destroyed, Arg[1].destroy_cargo_dropped_without_parachute, Arg[1].Cargo_Country)
				timer.removeFunction(Arg[1].scheduleFunctionID)
				Arg[1] = {}
			end
			return time + 0.1
		end
	end) -- pcall
	if not status then
		env.error(string.format("Cargo_Spawn: %s", result))
	else
		return result
	end
end

function Hercules_Cargo.Calculate_Cargo_Drop_initiator_NorthCorrection(point)	--correction needed for true north
	if not point.z then --Vec2; convert to Vec3
		point.z = point.y
		point.y = 0
	end
	local lat, lon = coord.LOtoLL(point)
	local north_posit = coord.LLtoLO(lat + 1, lon)
	return math.atan2(north_posit.z - point.z, north_posit.x - point.x)
end

function Hercules_Cargo.Calculate_Cargo_Drop_initiator_Heading(Cargo_Drop_initiator)
	local Heading = math.atan2(Cargo_Drop_initiator:getPosition().x.z, Cargo_Drop_initiator:getPosition().x.x)
	Heading = Heading + Hercules_Cargo.Calculate_Cargo_Drop_initiator_NorthCorrection(Cargo_Drop_initiator:getPosition().p)
	if Heading < 0 then
		Heading = Heading + (2 * math.pi)-- put heading in range of 0 to 2*pi
	end
	return Heading + 0.06 -- rad
end

function Hercules_Cargo.Cargo_Initialize(initiator, Cargo_Contents, Cargo_Type_name, Container_Enclosed)
	myLog:msg('Cargo_Initialize')
	myLog:msg(initiator)
	local status, result = pcall(
		function()
		Cargo_Drop_initiator = Unit.getByName(initiator:getName())
		local next = next
		if next(Cargo_Drop_initiator) ~= nil then
			j = j + 1
			Cargo[j] = {}
			Cargo[j].Cargo_Drop_Direction = Hercules_Cargo.Calculate_Cargo_Drop_initiator_Heading(Cargo_Drop_initiator)
			Cargo[j].Cargo_Contents = Cargo_Contents
			Cargo[j].Cargo_Type_name = Cargo_Type_name
			Cargo[j].Container_Enclosed = Container_Enclosed
			Cargo[j].Cargo_Country = initiator:getCountry()
		------------------------------------------------------------------------------
			if Hercules_Cargo.Calculate_Object_Height_AGL(Cargo_Drop_initiator) < 5.0 then--aircraft on ground
				Cargo[j].offload_cargo = true
			else
		------------------------------------------------------------------------------
				if Hercules_Cargo.Calculate_Object_Height_AGL(Cargo_Drop_initiator) < 10.0 then--aircraft less than 10m above ground
					Cargo[j].all_cargo_survive_to_the_ground = true
				else
		------------------------------------------------------------------------------
					if Hercules_Cargo.Calculate_Object_Height_AGL(Cargo_Drop_initiator) < 100.0 then--aircraft more than 10m but less than 100m above ground
						Cargo[j].all_cargo_gets_destroyed = true
					else
		------------------------------------------------------------------------------
						Cargo[j].destroy_cargo_dropped_without_parachute = true--aircraft more than 100m above ground
					end
				end
			end
		------------------------------------------------------------------------------
		local argTab = {Cargo[j],initiator}
			Cargo[j].scheduleFunctionID = timer.scheduleFunction(Hercules_Cargo.Cargo_Track, argTab, timer.getTime() + 0.1)
		end
	end) -- pcall
	if not status then
		env.error(string.format("Cargo_Initialize: %s", result))
	else
		return result
	end
end

--change cargotype per group (Wrench)
function Hercules_Cargo.setType(key,cargoType,cargoNum)
	Hercules_Cargo.carrierGroups[key]['cargoType'] = cargoType
	Hercules_Cargo.carrierGroups[key]['cargoNum'] = cargoNum
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- EventHandlers
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--S_EVENT_SHOT = {id = 1,  time = Time,  initiator = Unit,  weapon = Weapon}
function Hercules_Cargo.Hercules_Cargo_Drop_Events:onEvent(Cargo_Drop_Event)
		if Cargo_Drop_Event.id == world.event.S_EVENT_SHOT or Cargo_Drop_Event.id == 1 then
			GT_DisplayName = Weapon.getDesc(Cargo_Drop_Event.weapon).typeName:sub(15, -1)--Remove "weapons.bombs." from string
			 --trigger.action.outTextForCoalition(coalition.side.BLUE, string.format("Cargo_Drop_Event: %s", Weapon.getDesc(Cargo_Drop_Event.weapon).typeName), 10)
			 -- trigger.action.outTextForCoalition(coalition.side.RED, string.format("Cargo_Drop_Event: %s", Weapon.getDesc(Cargo_Drop_Event.weapon).typeName), 10)
				if Hercules_Cargo.types[GT_DisplayName] then
					local GT_Name = Hercules_Cargo.types[GT_DisplayName]['name']
					local Cargo_Container_Enclosed = Hercules_Cargo.types[GT_DisplayName]['container']
					Hercules_Cargo.Cargo_Initialize(Cargo_Drop_Event.initiator, Cargo_Drop_Event.weapon, GT_Name, Cargo_Container_Enclosed)
				end
				
	end
end
world.addEventHandler(Hercules_Cargo.Hercules_Cargo_Drop_Events)

--S_EVENT_BIRTH = {  id = 15,  time = Time,  initiator = Unit,}
Hercules_Cargo.birthEvent = {}
function Hercules_Cargo.birthEvent:onEvent(event)
	if event.id == 15 then
		local desc = event.initiator:getDesc()
		if desc["displayName"] == "Hercules" then
			local grpTab = {}
			grpTab['object'] = event.initiator:getGroup()
			grpTab['name'] = grpTab['object']:getName()
			grpTab['cargoType'] = 'konteiner_red1'
			grpTab['cargoNum'] = 1
			grpTab['key'] = #Hercules_Cargo.carrierGroups + 1
			
			table.insert(Hercules_Cargo.carrierGroups,grpTab)

			missionCommands.addCommandForGroup(grpTab['object']['id_'], 'Howitzer', hercCargoMenu, function() Hercules_Cargo.setType(grpTab['key'],'2A18M',3) end,nil)
			missionCommands.addCommandForGroup(grpTab['object']['id_'], 'MLRS', hercCargoMenu, function() Hercules_Cargo.setType(grpTab['key'],'MLRS',1) end,nil)
			missionCommands.addCommandForGroup(grpTab['object']['id_'], 'Mortar', hercCargoMenu, function() Hercules_Cargo.setType(grpTab['key'],'2B11 mortar',8) end,nil)
			missionCommands.addCommandForGroup(grpTab['object']['id_'], 'M-109', hercCargoMenu, function() Hercules_Cargo.setType(grpTab['key'],'M-109',1) end,nil)
			missionCommands.addCommandForGroup(grpTab['object']['id_'], 'FOB Crate', hercCargoMenu, function() Hercules_Cargo.setType(grpTab['key'],'konteiner_red1',1) end,nil)
		end
	end
end
world.addEventHandler(Hercules_Cargo.birthEvent )