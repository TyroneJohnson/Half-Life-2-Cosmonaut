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

    DbgPrint("-- Mapscript: Cosmonaut07 loaded --")

end

function MAPSCRIPT:PostInit()

    if SERVER then
 -- -196.759491 -10085.640625 58.548824;setang 37.012386 94.133331 0.000000

        local checkpoint1 = GAMEMODE:CreateCheckpoint(Vector(-196.759491 ,-10085.640625, 58.548824), Angle(0, 0, 0))
        local checkpointTrigger1 = ents.Create("trigger_once")
        checkpointTrigger1:SetupTrigger(
            Vector(-196.759491 ,-10085.640625, 58.548824),
            Angle(0, 0, 0),
            Vector(-150, -50, 0),
            Vector(150, 50, 70)
        )
        checkpointTrigger1.OnTrigger = function(_, activator)
            GAMEMODE:SetPlayerCheckpoint(checkpoint1, activator)
        end

        -- -2835.039795 -8969.174805 204.749954;setang 0.047010 -90.528473 0.000000


        local checkpoint2 = GAMEMODE:CreateCheckpoint(Vector(-2835.039795, -8969.174805, 204.749954), Angle(0, -90, 0))
        local checkpointTrigger2 = ents.Create("trigger_once")
        checkpointTrigger2:SetupTrigger(
            Vector(-2835.039795, -8969.174805, 204.749954),
            Angle(0, 0, 0),
            Vector(-150, -50, 0),
            Vector(150, 50, 70)
        )
        checkpointTrigger2.OnTrigger = function(_, activator)
            GAMEMODE:SetPlayerCheckpoint(checkpoint2, activator)
        end

      --  -1808.038452 -7700.858887 190.523315;setang -4.180252 -0.136078 0.000000

        local checkpoint3 = GAMEMODE:CreateCheckpoint(Vector(-1808.038452, -7700.858887, 190.523315), Angle(0, 0, 0))
        local checkpointTrigger3 = ents.Create("trigger_once")
        checkpointTrigger3:SetupTrigger(
            Vector(-1808.038452, -7700.858887, 190.523315),
            Angle(0, 0, 0),
            Vector(-150, -50, 0),
            Vector(150, 50, 70)
        )
        checkpointTrigger3.OnTrigger = function(_, activator)
            GAMEMODE:SetPlayerCheckpoint(checkpoint3, activator)
        end



    end

end

function MAPSCRIPT:PostPlayerSpawn(ply)

    --DbgPrint("PostPlayerSpawn")

end

return MAPSCRIPT
