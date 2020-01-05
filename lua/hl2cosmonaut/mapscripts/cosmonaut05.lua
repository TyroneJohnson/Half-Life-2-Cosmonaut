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

    DbgPrint("-- Mapscript: Cosmonaut05 loaded --")

end

function MAPSCRIPT:PostInit()

    if SERVER then

        -- 612.950317 -1495.914063 19.848751;setang -1.221226 89.430603 0.000000

        local checkpoint1 = GAMEMODE:CreateCheckpoint(Vector(612.950317, -1495.914063, 19.848751), Angle(0, 90, 0))
        local checkpointTrigger1 = ents.Create("trigger_once")
        checkpointTrigger1:SetupTrigger(
            Vector(612.950317, -1495.914063, 19.848751),
            Angle(0, 0, 0),
            Vector(-150, -50, 0),
            Vector(150, 50, 70)
        )
        checkpointTrigger1.OnTrigger = function(_, activator)
            GAMEMODE:SetPlayerCheckpoint(checkpoint1, activator)
        end

        -- 1203.195801 797.737732 -1828.832153;setang -1.370185 -179.729126 0.000000

        local checkpoint2 = GAMEMODE:CreateCheckpoint(Vector(1203.195801, 797.737732, -1828.832153), Angle(0, -180, 0))
        local checkpointTrigger2 = ents.Create("trigger_once")
        checkpointTrigger2:SetupTrigger(
            Vector(1203.195801, 797.737732, -1828.832153),
            Angle(0, 0, 0),
            Vector(-150, -50, 0),
            Vector(150, 50, 70)
        )
        checkpointTrigger2.OnTrigger = function(_, activator)
            GAMEMODE:SetPlayerCheckpoint(checkpoint2, activator)
        end

        -- 186.474258 -1310.347534 -962.940674;setang 1.447983 91.496918 0.000000
        
        local checkpoint3 = GAMEMODE:CreateCheckpoint(Vector(186.474258, -1310.347534, -962.940674), Angle(0, 90, 0))
        local checkpointTrigger3 = ents.Create("trigger_once")
        checkpointTrigger3:SetupTrigger(
            Vector(186.474258, -1310.347534, -962.940674),
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
