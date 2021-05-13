private ["_perklevel", "_requirelvl","_var"];

_disableInvisible= {
    
    sleep 0.1;
    player hideObject false;
    chocostring=  format["%1 hideObject false;",player];
    publicVariable"chocostring";
  
    bInvisibleOn = false;
    hint "You are now Visible (OFF).";
    _strExecCode = nil;
};
_requirelvl = 1000000;
_perklevel = player getVariable["basebuilder",0];

if(_perklevel >= _requirelvl) then {
    //Invisible Script
    if (isnil ("bInvisibleOn")) then 
    {
        bInvisibleOn = false;
    };

    if (!bInvisibleOn) then
    {   player hideObject true;
        chocostring=  format["%1 hideObject true;",player];
        publicVariable"chocostring";
        bInvisibleOn = true;
        hint "Your are now Invisible (ON), but i cost 1 Basebuilder point a second.";
        
        while{bInvisibleOn} do {
            sleep 1; 
            player setVariable["basebuilder",(player getVariable["basebuilder",0]) - 1,true];
            if((player getVariable["basebuilder",0]) < 1000000)then {
                bInvisibleOn= false;
                0 spawn _disableInvisible;
            };
        };

    }
    else
    {
    
    sleep 0.1;
    player hideObject false;
    chocostring=  format["%1 hideObject false;",player];
    publicVariable"chocostring";
    bInvisibleOn = false;
    hint "You are now Visible (OFF).";
    
    };

}else{

    _var= _requirelvl - _perklevel;
    player globalChat format["You don`t have enough basebuilder-points, you still need %1 points.", _var];
};

