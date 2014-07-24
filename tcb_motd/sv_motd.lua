/*---------------------------------------------------------------------------
	
	Made By: TheCodingBeast
	This work is licensed under the Creative Commons Attribution 4.0 International License. 
	To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.
	
---------------------------------------------------------------------------*/

include( 'sh_config.lua' );

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
			OpenMotdOnConsoleCommand()
		end
	end

end
hook.Add( "PlayerSay", "OpenMotdOnCommand", OpenMotdOnCommand )