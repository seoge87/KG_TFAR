class CfgVehicles {
	class Land_Device_slingloadable_F ;
	class KG_Radio_slingloadable_F : Land_Device_slingloadable_F  {	
		_generalMacro = "KG_Radio_slingloadable_F";
		author = "Kimcih Guys";
		displayName = "Radio Repeater";
		armor = 500;
		
		ace_cargo_canLoad = 1;
		ace_cargo_size = 2;
		
		class EventHandlers {
			init = "(_this select 0) setMass 1500; [(_this select 0), true, [0,2.5,0.2], 90] call ace_dragging_fnc_setDraggable;";
		};
		
		class UserActions {
			class unpack {
				condition = "alive this";
				displayName = "<t color='#78c878'>Deploy Radio Repeater</t>";
				displayNameDefault = "";
				onlyForplayer = 1;
				position = "temp";
				priority = 2;
				radius = 6;
				statement = "this spawn TFAR_fnc_repeater_unpack;";
				userActionID = 51;
			};
		};
	};
	
	class Land_Device_disassembled_F ;
    class KG_Radio_disassembled_F: Land_Device_disassembled_F  {
		_generalMacro = "KG_Radio_disassembled_F";
		armor = 500;
		author = "Kimcih Guys";
		displayname = "Radio Repeater";
		scope = 1;
		
		class UserActions {
			class pack {
				condition = "alive this";
				displayName = "<t color='#c89600'>Pack Radio Repeater</t>";
				displayNameDefault = "";
				onlyForplayer = 1;
				position = "temp";
				priority = 2;
				radius = 6;
				statement = "this spawn TFAR_fnc_repeater_pack;";
				userActionID = 52;
			};
		};
    };
};
