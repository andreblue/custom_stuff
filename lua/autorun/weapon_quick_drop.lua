local NetworkMessage = "CustomDropWeaponMessage"
if SERVER then
  util.AddNetworkString( NetworkMessage )
  net.Receive( NetworkMessage, function(len, ply)
    local weapon = net.ReadEntity()
    if not IsValid(weapon) then return end
    if DarkRP and IsValid(weapon) then
      ply:dropDRPWeapon( weapon )
    else
        SafeRemoveEntity(weapon)
    end
  end)
end

if CLIENT then
  local WeapDropKey = CreateClientConVar( "weapon_drop_key", "KEY_N", true, false, "Default: KEY_N \n Needs to be set to a key from https://wiki.garrysmod.com/page/Enums/KEY" )
  local SendMessage = CurTime() + 15
  hook.Add( "Think", "CustomWeaponDropThink", function()
  	if input.IsKeyDown( _G[WeapDropKey:GetString()] ) and CurTime() > SendMessage then
      SendMessage = CurTime() + 15
      net.Start( NetworkMessage )
        net.WriteEntity( LocalPlayer():GetActiveWeapon())
      net.SendToServer()
    end
  end )
  
end
