# custom_stuff
Currently has a weapon system to only allow one primary, secondary, melee/grenade, and others. Also adds a simple colored chat message function. Also adds a quick way to drop a weapon, with N as default.


## Colored Chat Messages
### Player:ChatPrintColored( vararg )
Called on the player and you simply pass it contents like a [chat.AddText( vararg arguments )](http://wiki.garrysmod.com/page/chat/AddText)
### Player:ConsolePrintColored( vararg )
Called on the player and you simply pass it contents like a [MsgC( vararg arguments )](http://wiki.garrysmod.com/page/Global/MsgC)
### BroadcastChatPrintColored( vararg )
Broadcasts a colored chat message to all players and you simply pass it contents like a [chat.AddText( vararg arguments )](http://wiki.garrysmod.com/page/chat/AddText)
### BroadcastConsolePrintColored( vararg )
Broadcasts a colored console message to all players and you simply pass it contents like a [MsgC( vararg arguments )](http://wiki.garrysmod.com/page/Global/MsgC)
##Weapon System
###Setup
Simply add ```SWEP.WeaponSlot = "Slot Name"``` to your weapon files. Next time a player tries to put a gun with the same slot, they will drop the existing one.
##Weapon Drop Bind
The default weapon drop bind is ```N```, you can change this in ```autorun/weapon_quick_drop.lua``` which you need to use the [KeyBoard Enums](http://wiki.garrysmod.com/page/Enums/KEY)
