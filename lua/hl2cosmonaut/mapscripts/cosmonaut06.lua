AddCSLuaFile()

local DbgPrint = GetLogging("MapScript")
local MAPSCRIPT = {}

MAPSCRIPT.PlayersLocked = false
MAPSCRIPT.DefaultLoadout =
{
    Weapons =
    {
        "weapon_lambda_medkit",
        "weapon_crowbar",
        "weapon_pistol",
        "weapon_smg1",
        "weapon_shotgun",
        "weapon_physcannon",
    },
    Ammo =
    {
        ["Pistol"] = 26,
        ["SMG1"] = 45,
        ["Shotgun"] = 6,
    },
    Armor = 50,
    HEV = true,
}

MAPSCRIPT.InputFilters =
{
}

MAPSCRIPT.EntityFilterByClass =
{
    --["env_global"] = true,
}

MAPSCRIPT.EntityFilterByName =
{
    --["spawnitems_template"] = true,
}

MAPSCRIPT.VehicleGuns = true

function MAPSCRIPT:Init()

 function PlayerSelectSpawn( pl )

	local spawns = ents.FindByClass( "info_player_start" )
	local trigger_start_teleport_new_game = Vector(-800.578247, -13238.474609, 549.982178)

	return spawns[ trigger_start_teleport_new_game ]

end

    DbgPrint("-- Mapscript: Cosmonaut04 loaded --")

end

function MAPSCRIPT:PostInit()

    if SERVER then
 -- 48.945339 -6613.914063 403.514130;setang 5.824311 61.536377 0.000000
        local checkpoint1 = GAMEMODE:CreateCheckpoint(Vector(48.945339, -6613.914063, 403.514130), Angle(0, 0, 0))
        local checkpointTrigger1 = ents.Create("trigger_once")
        checkpointTrigger1:SetupTrigger(
            Vector(48.945339, -6613.914063, 403.514130),
            Angle(0, 0, 0),
            Vector(-150, -50, 0),
            Vector(150, 50, 70)
        )
        checkpointTrigger1.OnTrigger = function(_, activator)
            GAMEMODE:SetPlayerCheckpoint(checkpoint1, activator)
        end

        -- 557.738281 -4585.732910 277.955200;setang 1.878877 179.474808 0.000000

        local checkpoint2 = GAMEMODE:CreateCheckpoint(Vector(557.738281, -4585.732910, 277.955200), Angle(0, 180, 0))
        local checkpointTrigger2 = ents.Create("trigger_once")
        checkpointTrigger2:SetupTrigger(
            Vector(557.738281, -4585.732910, 277.955200),
            Angle(0, 0, 0),
            Vector(-150, -50, 0),
            Vector(150, 50, 70)
        )
        checkpointTrigger2.OnTrigger = function(_, activator)
            GAMEMODE:SetPlayerCheckpoint(checkpoint2, activator)
        end

        for _,v in pairs(ents.FindByClass("info_player_start")) do
            v:Remove()
        end

        local playerStart = ents.Create("info_player_start")
        playerStart:SetPos(Vector(-813.180298, -13200, 508.796326))
        playerStart:Spawn()
        playerStart.MasterSpawn = true


    end

end

function MAPSCRIPT:PostPlayerSpawn(ply)

    --DbgPrint("PostPlayerSpawn")

end

return MAPSCRIPT
