private["_localName", "_hintText"];
if (alive TFAR_currentUnit) then {
	_localName = "STR_voice_yelling";
	if (TF_speak_volume_level == "Whispering") then {
		TF_speak_volume_level = "yelling";
		TF_speak_volume_meters = 100;
		_localName = localize "STR_voice_yelling";
	} else {
		if (TF_speak_volume_level == "Normal") then {
			TF_speak_volume_level = "yelling";
			TF_speak_volume_meters = 100;
			_localName = localize "STR_voice_yelling";
		} else {
			TF_speak_volume_level = "yelling";
			TF_speak_volume_meters = 100;
			_localName = localize "STR_voice_yelling";
		}
	};
	_hintText = format[localize "STR_voice_volume", _localName];
	[parseText (_hintText), 5] call TFAR_fnc_showHint;
	//							unit, range
	["OnSpeakVolume", TFAR_currentUnit, [TFAR_currentUnit, TF_speak_volume_meters]] call TFAR_fnc_fireEventHandlers;
};
true