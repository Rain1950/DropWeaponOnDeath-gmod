DropWeaponOnDeath.Config = {} 

DropWeaponOnDeath.Config.WeaponVelocity = 1000  // velocity of weapon that is thrown
 
DropWeaponOnDeath.Config.DiscardWeaponsFromExplosion = true      // discard weapons if player died from explosion


DropWeaponOnDeath.Config.BlacklistedJobs = {
  "Medic",                                                //jobs that don't drop any weapons
  "Citizen"
}


DropWeaponOnDeath.Config.BlacklistedWeapons = {
   "keys",
   "pocket",
   "stunstick",                     //blacklisted weapons
   "weaponchecker",
   "weapon_fists",
   "arrest_stick",
   "weapon_physcannon",
   "gmod_tool",
   "weapon_physgun",
}

