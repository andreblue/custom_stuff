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
##Restart Timer
This will stop the server, restart needs to be done by something in the back end, such as [this bat file.](https://gist.github.com/andreblue/93cab18f5d457c302a3885494c5d33fa) Then you need to go into ```autorun/server/auto_restart.lua``` and add times to the tables like what is already there. Remember they need to be in 24 hour format with the leading zero, so 4am is ```'04:00'```, while 4:45pm would be ```'16:45'```, and that follows in the notify times table as well. You can input as many things as you want into it, and it accepts the same data as BroadcastChatPrintColored( vararg ) from above. 
