
private ["_messageArray"];

_messageArray = [
"Parachute Store for Vehicles , Bulings, Choppers, Planes , Jets,Generals , Weapons buy on each position press F5.",
"killing players will increase your Bounty and this will increase all your Rewards and unlock Talents.",
"Become an Animal with a specific Mission and increase your Animal skill and unlock new Talents.",
"Basecore - do you like building a Base, get the Basecore from the Parastore, get money and Basebuilderpoints to unlock new Talents",
"Mission Rewards and improved Npcs with random Weapons and Rewards.",
"ChocoSupply will Spawn Vehicles and Objects on the Map every Hour.",
"CustomVehicles, unlocked when you reached 100.000 Bountypoints, Recolor, Reskin or attach Vehicles on other Vehicles.",
"Killfeed - check you epic stats in via Killfeed button in your PlayerMenu.",
"Fast Respawn - you will Allways spawn Random on Midair, you could buy a Spawn Beacon to Lock spawn position.",
"Object improved baseparts - unlock only Owner of Object, move up /down , release correctly.",
"Persistent - playerprofile will save you stats over disconnects and restarts but the map will get every Month a nuklear Whipe."
];
sleep 120;
while {true} do
{ 
hint parseText format	["<t color='#FFFFFF' shadow='2' size='1.75'>Maldenstorm 2035</t><br/>" +
			"<t color='#FFFFFF'>------------------------------</t><br/>" +
			"<t color='#FFFFFF' size='1.0'>%1</t>",selectRandom _messageArray];
[10000,0]call getMoneyReward;
sleep 600;
};
//"ChocoDoor - use it on a  building with ""O"" (lookedObject) to open like a door, eg. entrance for your big Base.",
//Save Vehicle - Save your favorite Vehicle in your Special Hangar and get it back on your playerMenu.",
//"Choco King - be the Best player and become the Choco King and you will get Money 1% for all purchcasing Items.",