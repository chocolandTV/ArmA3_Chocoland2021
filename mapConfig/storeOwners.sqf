 
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
 
//	@file Name: storeOwners.sqf
//	@file Author: AgentRev, JoSchaap, His_Shadow

// Notes: Gun and general stores have position of spawned crate, vehicle stores have an extra air spawn direction
//
// Array contents are as follows:
// Name, Building Position (-1 to stay in original position), Desk Direction (or [Desk Direction, Front Offset], or [] to stay in original direction), Excluded Buttons
storeOwnerConfig = compileFinal str
[];

// Outfits for store owners
storeOwnerConfigAppearance = compileFinal str
[];
