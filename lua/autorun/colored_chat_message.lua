local MessageName = "CustomColoredChatMessage"
if SERVER then
  util.AddNetworkString( MessageName )
  local PLYMETA = FindMetaTable( "Player" )
  function PLYMETA:ChatPrintColored( ... )
    net.Start( MessageName )
      net.WriteBool(false)
      net.WriteTable( { ... } )
    net.Send(self)
  end
  function PLYMETA:ConsolePrintColored( ... )
    net.Start( MessageName )
      net.WriteBool(true)
      net.WriteTable( { ... } )
    net.Send(self)
  end
  function BroadcastChatPrintColored(...)
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
