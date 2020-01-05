AddCSLuaFile()

local DbgPrint = GetLogging("MapScript")
local MAPSCRIPT = {}

MAPSCRIPT.PlayersLocked = false
MAPSCRIPT.DefaultLoadout =
{
    Weapons =
    {

    },
    Ammo =
    {

    },
    Armor = 0,
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

        ents.WaitForEntityByName("view_01", function(ent)
            ent:SetKeyValue("spawnflags", "398")
        end)

                ents.WaitForEntityByName("view_02", function(ent)
            ent:SetKeyValue("spawnflags", "398")
        end)

                ents.WaitForEntityByName("view_03", function(ent)
            ent:SetKeyValue("spawnflags", "398")
        end)

                ents.WaitForEntityByName("view_phase2_03", function(ent)
            ent:SetKeyValue("spawnflags", "398")
        end)

    DbgPrint("-- Mapscript: Cosmonaut01 loaded --")

end

function MAPSCRIPT:PostInit()

    if SERVER then

        -- 1915.561768 -19.246124 -5120.762695

        local checkpoint1 = GAMEMODE:CreateCheckpoint(Vector(5135.214355, 223.086563, 275.143311), Angle(0, -90, 0))
        local checkpointTrigger1 = ents.Create("trigger_once")
        checkpointTrigger1:SetupTrigger(
            Vector(5135.214355, 223.086563, 275.143311),
            Angle(0, 0, 0),
            Vector(-150, -50, 0),
            Vector(150, 50, 70)
        )
        checkpointTrigger1.OnTrigger = function(_, activator)
            GAMEMODE:SetPlayerCheckpoint(checkpoint1, activator)
        end

    end

end

function MAPSCRIPT:PostPlayerSpawn(ply)

    --DbgPrint("PostPlayerSpawn")

end

return MAPSCRIPT
