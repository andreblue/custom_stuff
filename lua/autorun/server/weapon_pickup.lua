local Messages = {
  "You are only allowed 1 pirmary weapon. Your other one was dropped.",
  "You are only allowed 1 secondary weapon. Your other one was dropped.",
  "You are only allowed 1 grenade/melee weapon. Your other  one was dropped."
}

local function doWeaponPickUp( weaponThing )
  timer.Simple( 0, function()
    local ply = weaponThing:GetOwner()
    if ply:IsValid() then
      local weapons = ply:GetWeapons()
      for _, weapon in ipairs( weapons ) do
        if weapon == weaponThing then continue end
        if not weapon.WeaponSlot then continue end
        if weapon.WeaponSlot == weaponThing.WeaponSlot then
          ply:ChatPrintColored( Color(255,0,0), Messages[weapon.WeaponSlot] )
          if DarkRP then
            ply:dropDRPWeapon( weapon )
          else
            SafeRemoveEntity(weapon)
          end
        end
      end
    end
  end)
end

hook.Remove( "WeaponEquip", "OnlyAllowOneType" )
hook.Add( "WeaponEquip", "OnlyAllowOneType", doWeaponPickUp )
