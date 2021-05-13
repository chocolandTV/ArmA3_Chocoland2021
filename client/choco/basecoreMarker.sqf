// new marker script triggers in near 1000meters for all basecores and exchanger
private "_cores";
setGroupIconsVisible [true, true];
while {true} do 
    {
         _cores = nearestObjects [player, ["B_G_Survivor_F"], 250000];
        {
           clearGroupIcons group _x;
			group _x addGroupIcon ["n_inf"];
			group _x setGroupIconParams [[1, 1, 0, 1], format ["%1 Base(deposit: %2$)", _x getVariable["name",""],(_x getVariable["wallet",0])], 1, true];
        }forEach _cores;
        sleep 60;
    };