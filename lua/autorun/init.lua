// Author:  Rain


DropWeaponOnDeath = {}
include("DropWeapon_Config.lua")
AddCSLuaFile("DropWeapon_Config.lua")

weapon = NULL    //global weapon declaration



function  checkTable(value,table)
     result = false 
     for k, l in ipairs(table) do
          if value == table[k] then      //check given table for value
               result = true
          end
     end
     return result
     
end



NextUpdateTime = 0
CheckGround = ture
hook.Add("Think","CheckGround",function ()
     if (CurTime() >= NextUpdateTime && CheckGround) then
          NextUpdateTime = CurTime() + 1
          if weapon:IsValid() == false  then return 
          elseif (weapon:GetVelocity():Length() <= 0.3) then
               weapon:PhysicsDestroy()
               currentPos = weapon:GetPos()
               if(string.find(weapon:GetClass(),"tfa")) then        //tfa weapons have weird colliders and usually are in ground. To counter this, TFA weapons are 5 units higher after "freezing"
                  weapon:SetPos(Vector(currentPos.x,currentPos.y,currentPos.z+5))
               end
               CheckGround = false 
          end
       
     end
     
    end)


hook.Add("DoPlayerDeath","habibi",function (ply,attacker,dmg)
     if dmg:IsExplosionDamage() && DropWeaponOnDeath.Config.DiscardWeaponsFromExplosion == true   then 
          return  
     end // if damage is from explosion, don't drop the weapon


     JobName = team.GetName(ply:Team())
     if checkTable(JobName,DropWeaponOnDeath.Config.BlacklistedJobs) then
          return 
     else 
          weapon = ply:GetActiveWeapon()         
          if checkTable(weapon:GetClass(),DropWeaponOnDeath.Config.BlacklistedWeapons) == false  then
               ply:DropWeapon(weapon,nil,attacker:GetAimVector() * DropWeaponOnDeath.Config.WeaponVelocity)
               CheckGround = true
          end
          
     end
     
     
     
 
end)









//Author: Rain
     




