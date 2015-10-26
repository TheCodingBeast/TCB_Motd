/*---------------------------------------------------------------------------
	
	Creator: TheCodingBeast - TheCodingBeast.com
	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
	
---------------------------------------------------------------------------*/

-- Player Spawn
local function OpenMotdOnJoin( ply )

	if OpenOnJoin == true then

		umsg.Start( "TcbMotd", ply )
		umsg.End()

	end

end
hook.Add( "PlayerInitialSpawn", "OpenMotdOnJoin", OpenMotdOnJoin )

-- Console Command
local function OpenMotdOnConsoleCommand( ply )

	umsg.Start( "TcbMotd", ply )
	umsg.End()

end
concommand.Add( "TcbMotd", OpenMotdOnConsoleCommand )

-- Chat Command
local function OpenMotdOnCommand( ply, command, team )

	for k,v in pairs(OpenCommands) do
		if command == v then
			OpenMotdOnConsoleCommand( ply )
		end
	end

end
hook.Add( "PlayerSay", "OpenMotdOnCommand", OpenMotdOnCommand )