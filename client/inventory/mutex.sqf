 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
 
#define ERR_MUTEX_LOCKED localize "STR_WL_Errors_InProgress"
#define MUTEX_LOCK_OR_FAIL \
	if mutexScriptInProgress exitWith {hint ERR_MUTEX_LOCKED;}; \
	mutexScriptInProgress = true;
#define MUTEX_UNLOCK mutexScriptInProgress = false; doCancelAction = false

