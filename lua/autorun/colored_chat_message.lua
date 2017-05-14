local MessageName = "CustomColoredChatMessage"
if SERVER then
  util.AddNetworkString( MessageName )
  function BroadcastChatPrintColored( ... )
    net.Start( MessageName )
      net.WriteBool(false)
      net.WriteTable( { ... } )
    net.Broadcast()
  end
  function BroadcastConsolePrintColored( ... )
    net.Start( MessageName )
      net.WriteBool(true)
      net.WriteTable( { ... } )
    net.Broadcast()
  end
  local PLYMETA = FindMetaTable( "Player" )
  function PLYMETA:ChatPrintColored( ... )
    BroadcastChatPrintColored( ... )
  end
  function PLYMETA:ConsolePrintColored( ... )
    BroadcastConsolePrintColored( ... )
  end
end

if CLIENT then
  net.Receive( MessageName, function(len, ply)
    local console = net.ReadBool()
    local contents = net.ReadTable()
    if console then
      MsgC(unpack(contents))
      MsgC("\n")
    else
      chat.AddText(unpack(contents))
    end
  end)
end
