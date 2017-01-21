local NetworkMessage = "CustomDropWeaponMessage"
if SERVER then
  util.AddNetworkString( NetworkMessage )
  net.Receive( NetworkMessage, function(len, ply)
    local weapon = net.ReadEntity()
    if weapon.WeaponSlot then
      ply:dropDRPWeapon( weapon )
    end
  end)
end

if CLIENT then
  local SendMessage = CurTime() + 15
  hook.Add( "Think", "CustomWeaponDropThink", function()
  	if input.IsKeyDown( KEY_N ) and CurTime() > SendMessage then
      SendMessage = CurTime() + 15
      net.Start( NetworkMessage )
        net.WriteEntity( LocalPlayer():GetActiveWeapon())
      net.SendToServer()
    end
  end )
end
