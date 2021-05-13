
private ["_perklevel", "_requirelvl","_var"];
_requirelvl = 1;
_perklevel = player getVariable["basebuilder",0];


if(_perklevel >= _requirelvl) then {
    
    if(BASECORE) then  //when allready unlocked
    {
        if((_this select 0) == 1)then{
                _playerMoney = player getVariable ["cmoney", 0];
                if(_playerMoney < 10000)exitWith{
                    player globalChat "Action failed! - the basecore costs 10.000$";
                };
                _player setVariable ["cmoney", _playerMoney - 10000, true];
                [_player, -_price] call A3W_fnc_setCMoney;
                [] spawn fn_savePlayerData;
                0 spawn createBasecore;
            }
            else
            {
                0 spawn createBasecore;
            };

    }else// unlock 
    { 
        BASECORE = true;
        player globalChat "get the basecore from the object store or your playermenu basecore button";
    };

}else{

_var= _requirelvl - _perklevel;
player globalChat format["You don`t have enough basebuilder-points, you still need %1 points.", _var];
};
