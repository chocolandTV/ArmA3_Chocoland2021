 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
 
//	@file Name: customKeys.sqf
//	@file Author: AgentRev

// Load custom keys from profile

private ["_varName", "_defKeys", "_customKeys", "_isValid", "_voiceKeys"];

{
	_varName = _x select 0;
	_defKeys = _x select 1;
	_customKeys = profileNamespace getVariable _varName;

	// check that each variable read from profile is an array strictly containing between 1 to 10 numbers, otherwise use default values
	_isValid = !isNil "_customKeys" && {_customKeys isEqualType [] && {count _customKeys > 0 && count _customKeys <= 10 && {_customKeys isEqualTypeAll 0}}};

	missionNamespace setVariable [_varName, if (_isValid) then { _customKeys } else { _defKeys }];
}
forEach
[
	["A3W_customKeys_adminMenu", [22]], // 22 = U
	["A3W_customKeys_playerMenu", [41]], // 41 = Tilde (above Tab)
	["A3W_customKeys_playerNames", [199,219,220]], // 199 = Home, 219 = LWin, 220 = RWin
	["A3W_customKeys_earPlugs", [207]], // 207 = End
	["Choco_customKeys_Parastore",[63]], //F5
	["Choco_customKeys_MoveUP",[19]], // object move up R
	["Choco_customKeys_MoveDown",[20]], // object move down T
	["Choco_customKeys_AttachW",[17]],//attach W
	["Choco_customKeys_AttachA",[30]],// attach A
	["Choco_customKeys_AttachS",[31]],// attach S
	["Choco_customKeys_AttachD",[32]],// attach D
	["Choco_customKeys_AttachESC",[1]],// attach ESC
	["Choco_customKeys_SmartAmmo",[61]]// F3 smartAmmo
];

_voiceKeys = [];
{ _voiceKeys append actionKeys _x } forEach
[
	"NextChannel",
	"PrevChannel",
	"PushToTalk",
	"PushToTalkAll",
	"PushToTalkCommand",
	"PushToTalkDirect",
	"PushToTalkGroup",
	"PushToTalkSide",
	"PushToTalkVehicle"
];

A3W_allVoiceChatKeys = compileFinal str _voiceKeys;
