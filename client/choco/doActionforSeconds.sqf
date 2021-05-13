private["_totalDuration"];
doaction = true;
R3F_LOG_mutex_local_verrou = true;
_totalDuration = _this select 0;
_checks =
{
			private ["_progress", "_object", "_failed", "_text"];
			_progress = _this select 0;
			_object = _this select 1;
			_failed = true;

			switch (true) do
			{
				case (!alive player): {R3F_LOG_mutex_local_verrou = false; _text ="you died, cancelled" };
				case (doCancelAction): { doCancelAction = false; _text = "cancelled" };
				case (vehicle player != player): { _text = "Action failed! You can't do this in a vehicle" };
				default
				{
					_failed = false;
					_text = format ["disabling %1%2 complete", floor (_progress * 100), "%"];
				};
			};

			[_failed, _text];
};

		_success = [_totalDuration, "AinvPknlMstpSlayWrflDnon_medic", _checks, [player]] call a3w_actions_start;

		if (_success) then
		{
			
			["done!", 5] call mf_notify_client;
			doaction = false;
		};

		R3F_LOG_mutex_local_verrou = false;
