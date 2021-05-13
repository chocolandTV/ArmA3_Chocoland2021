 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
 
#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'client\systems\playerMenu\item_list.sqf'";

	class controlsBackground {

		class MainBG : IGUIBack {
			idc = -1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0.6};

			moving = true;
			x = 0.0; y = 0.1;
			w = .745; h = 1.2;
		};

		class TopBar: IGUIBack
		{
			idc = -1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {A3W_UICOLOR_R, A3W_UICOLOR_G, A3W_UICOLOR_B, 0.8};

			x = 0;
			y = 0.1;
			w = 0.745;
			h = 0.05;
		};

		class MainTitle : w_RscText {
			idc = -1;
			text = "Player Inventory";
			sizeEx = 0.04;
			shadow = 2;
			x = 0.260; y = 0.1;
			w = 0.3; h = 0.05;
		};

		class waterIcon : w_RscPicture {
			idc = -1;
			text = "\A3\ui_f\data\igui\cfg\simpletasks\types\container_ca.paa";
			x = 0.022; y = 0.2;
			w = 0.04 / (4/3); h = 0.04;
		};
		class waterIcon2 : w_RscPicture {
			idc = -1;
			text = "\A3\ui_f\data\igui\cfg\simpletasks\types\defend_ca.paa";
			x = 0.022; y = 0.38;
			w = 0.04 / (4/3); h = 0.04;
		};
		class foodIcon : w_RscPicture {
			idc = -1;
			text = "\a3\ui_f\data\map\vehicleicons\iconanimal_ca.paa";
			x = 0.022; y = 0.26;
			w = 0.04 / (4/3); h = 0.04;
		};

		class moneyIcon : w_RscPicture {
			idc = -1;
			text = "\A3\ui_f\data\igui\cfg\cursors\leader_ca.paa";
			x = 0.022; y = 0.32;
			w = 0.04 / (4/3); h = 0.04;
		};

		class waterText : w_RscText {
			idc = water_text;
			text = "";
			sizeEx = 0.03;
			x = 0.06; y = 0.193;
			w = 0.3; h = 0.05;
		};

		class foodText : w_RscText {
			idc = food_text;
			sizeEx = 0.03;
			text = "";
			x = 0.06; y = 0.254;
			w = 0.3; h = 0.05;
		};

		class moneyText : w_RscText {
			idc = money_text;
			text = "";
			sizeEx = 0.03;
			x = 0.06; y = 0.313;
			w = 0.3; h = 0.05;
		};

		class distanceText : w_RscText {
			idc = view_range_text;
			text = "";
			sizeEx = 0.03;
			x = 0.06; y = 0.372;
			w = 0.3; h = 0.05;
		};

		class uptimeText : w_RscText {
			idc = uptime_text;
			text = "";
			sizeEx = 0.030;
			x = 0.52; y = 0.69;
			w = 0.225; h = 0.03;
		};
		class bountyText : w_RscText {
			idc = -1;
			text = "Bounty Unlock Progression";
			sizeEx = 0.040;
			x = 0.2; y = 0.75;
			w = 0.36; h = 0.04;
		};
		class baseBuilderText : w_RscText {
			idc = -1;
			text = "Basebuilder Unlock Progression";
			sizeEx = 0.040;
			x = 0.2; y = 0.90;
			w = 0.36; h = 0.04;
		};
		class animalText : w_RscText {
			idc = -1;
			text = "Animal Unlock Progression";
			sizeEx = 0.040;
			x = 0.2; y = 1.10;
			w = 0.36; h = 0.04;
		};
	};

	class controls {

		class itemList : w_Rsclist {
			idc = item_list;
			x = 0.49; y = 0.185;
			w = 0.235; h = 0.325;
		};

		class DropButton : w_RscButton {
			idc = -1;
			text = "Drop";
			onButtonClick = "[1] execVM 'client\systems\playerMenu\itemfnc.sqf'";
			x = 0.610; y = 0.525;
			w = 0.116; h = 0.033 * safezoneH;
		};

		class UseButton : w_RscButton {
			idc = -1;
			text = "Use";
			onButtonClick = "[0] execVM 'client\systems\playerMenu\itemfnc.sqf'";
			x = 0.489; y = 0.525;
			w = 0.116; h = 0.033 * safezoneH;
		};

		class moneyInput: w_RscCombo {
			idc = money_value;
			x = 0.610; y = 0.618;
			w = .116; h = .030;
		};

		class DropcButton : w_RscButton {
			idc = -1;
			text = "Drop";
			onButtonClick = "[] execVM 'client\systems\playerMenu\dropMoney.sqf'";
			x = 0.489; y = 0.60;
			w = 0.116; h = 0.033 * safezoneH;
		};

		class CloseButton : w_RscButton {
			idc = close_button;
			text = "Close";
			onButtonClick = "[] execVM 'client\systems\playerMenu\closePlayerMenu.sqf'";
			x = 0.02; y = 0.66;
			w = 0.125; h = 0.033 * safezoneH;
		};

		class GroupsButton : w_RscButton {
			idc = groupButton;
			text = "Group Management";
			onButtonClick = "[] execVM 'client\systems\groups\loadGroupManagement.sqf'";
			x = 0.158; y = 0.66;
			w = 0.225; h = 0.033 * safezoneH;
		};
		class btnDistanceCHVD : w_RscButton {
			idc = -1;
			text = "Viewdist.";
			onButtonClick = "call CHVD_fnc_openDialog";
			x = 0.02; y = 0.57;
			w = 0.125; h = 0.033 * safezoneH;
		};
		class btnKillfeed : w_RscButton {
			idc = -1;
			text = "Killfeed";
			onButtonClick = "with missionNamespace do { [] call A3W_fnc_killFeedMenu }";
			x = 0.158; y = 0.57;
			w = 0.125; h = 0.033 * safezoneH;
		};
		class btnKillfeed2 : w_RscButton {
			idc = -1;
			text = "Disable Infos";
			onButtonClick = "NOINFO = true;hint'Info disabled';";
			x = 0.27; y = 0.57;
			w = 0.15; h = 0.033 * safezoneH;
		};
		class b_unlock_1 : w_RscButton {
			idc = bountyu1;
			text = "Keep Weapon";
			onButtonClick = "call b_unlock1";
			x = 0.00; y = 0.81;
			w = 0.14; h = 0.033 * safezoneH;
		};
		class b_unlock_2 : w_RscButton {
			idc = bountyu2;
			text = "smart ammo buy";
			onButtonClick = "call b_unlock2";
			x = 0.10; y = 0.81;
			w = 0.15; h = 0.033 * safezoneH;
		};
		class b_unlock_3 : w_RscButton {
			idc = bountyu3;
			text = "satellite Camera";
			onButtonClick = "call b_unlock3";
			x = 0.24; y = 0.81;
			w = 0.17; h = 0.033 * safezoneH;
		};
		class b_unlock_4 : w_RscButton {
			idc = bountyu4;
			text = "attach menu";
			onButtonClick = "call b_unlock4";
			x = 0.40; y = 0.81;
			w = 0.18; h = 0.033 * safezoneH;
		};
		class b_unlock_5 : w_RscButton {
			idc = bountyu5;
			text = "infinite Ammunition";
			onButtonClick = "call b_unlock5";
			x = 0.56; y = 0.81;
			w = 0.18; h = 0.033 * safezoneH;
		};
		class c_unlock_1 : w_RscButton {
			idc = basebuilderu1;
			text = "Basecore";
			onButtonClick = "[1]call c_unlock1";
			x = 0.00; y = 0.98;
			w = 0.14; h = 0.033 * safezoneH;
		};
		class c_unlock_2 : w_RscButton {
			idc = basebuilderu2;
			text = "Multibuy";
			onButtonClick = "call c_unlock2";
			x = 0.1; y = 0.980;
			w = 0.15; h = 0.033 * safezoneH;
		};
		class c_unlock_3 : w_RscButton {
			idc = basebuilderu3;
			text = "auto -flak";
			onButtonClick = "call c_unlock3";
			x = 0.24; y = 0.98;
			w = 0.17; h = 0.033 * safezoneH;
		};
		class c_unlock_4 : w_RscButton {
			idc = basebuilderu4;
			text = "1ClickBase";
			onButtonClick = "call c_unlock4";
			x = 0.40; y = 0.98;
			w = 0.18; h = 0.033 * safezoneH;
		};
		class c_unlock_5 : w_RscButton {
			idc = basebuilderu5;
			text = "invisible";
			onButtonClick = "call c_unlock5";
			x = 0.56; y = 0.98;
			w = 0.18; h = 0.033 * safezoneH;
		};
		class a_unlock_1 : w_RscButton {
			idc = animalu1;
			text = "Jumping";
			onButtonClick = "call a_unlock1";
			x = 0.00; y = 1.15;
			w = 0.14; h = 0.033 * safezoneH;
		};
		class a_unlock_2 : w_RscButton {
			idc = animalu2;
			text = "Bite";
			onButtonClick = "call a_unlock2";
			x = 0.10; y = 1.15;
			w = 0.15; h = 0.033 * safezoneH;
		};
		class a_unlock_3 : w_RscButton {
			idc = animalu3;
			text = "plant bombs";
			onButtonClick = "call a_unlock3";
			x = 0.24; y = 1.15;
			w = 0.18; h = 0.033 * safezoneH;
		};
		class a_unlock_4 : w_RscButton {
			idc = animalu4;
			text = "become seagull";
			onButtonClick = "call a_unlock4";
			x = 0.40; y = 1.15;
			w = 0.18; h = 0.033 * safezoneH;
		};
		class a_unlock_5 : w_RscButton {
			idc = animalu5;
			text = "fly mode";
			onButtonClick = "call a_unlock5";
			x = 0.56; y = 1.15;
			w = 0.18; h = 0.033 * safezoneH;
		};
	};
};
