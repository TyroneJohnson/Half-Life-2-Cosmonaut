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
    },
    Ammo =
    {
        ["Pistol"] = 26,
        ["SMG1"] = 45,
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

    -- temporary majestic fix 
        ents.WaitForEntityByName("blocking_gate_main", function(ent)
                    --ent:SetKeyValue("spawnflags", "1024")
                    --ent:Fire("open")
        end)
    -- ^
        local plugTrigger = ents.Create("trigger_once")
        plugTrigger:Fire("AddOutput", "OnTrigger plug_1_main,Use")
        plugTrigger:SetupTrigger(
            Vector(-4627.315918, -393.385986, 328.538116),
            Angle(0,0,0),
            Vector(-20, -40, 20),
            Vector(40, -80, 120)
        )

    DbgPrint("-- Mapscript: Cosmonaut04 loaded --")
end
    

function MAPSCRIPT:PostInit()

        -- 1915.561768 -19.246124 -5120.762695

    if SERVER then

        local checkpoint1 = GAMEMODE:CreateCheckpoint(Vector(-4359.965332, -671.148560, 420.754150), Angle(0, 0, 0))
        local checkpointTrigger1 = ents.Create("trigger_once")
        checkpointTrigger1:SetupTrigger(
            Vector(-4359.965332, -671.148560, 420.754150),
            Angle(0, 0, 0),
            Vector(-150, -50, 0),
            Vector(150, 50, 70)
        )
        checkpointTrigger1.OnTrigger = function(_, activator)
            GAMEMODE:SetPlayerCheckpoint(checkpoint1, activator)
        end

        -- 5071.660156 1895.480713 433.023865;setang 7.045401 84.828064 0.000000


        local checkpoint2 = GAMEMODE:CreateCheckpoint(Vector(5071.660156, 1895.480713, 433.023865), Angle(0, 90, 0))
        local checkpointTrigger2 = ents.Create("trigger_once")
        checkpointTrigger2:SetupTrigger(
            Vector(5071.660156, 1895.480713, 433.023865),
            Angle(0, 0, 0),
            Vector(-150, -50, 0),
            Vector(150, 50, 70)
        )
        checkpointTrigger2.OnTrigger = function(_, activator)
            GAMEMODE:SetPlayerCheckpoint(checkpoint2, activator)
        end

         -- setpos -3425.803711 -144.381561 20.551086;setang 0.469802 7.680716 0.000000

        local checkpoint3 = GAMEMODE:CreateCheckpoint(Vector(-3425.803711, -144.381561, 20.551086), Angle(0, 0, 0))
        local checkpointTrigger3 = ents.Create("trigger_once")
        checkpointTrigger3:SetupTrigger(
            Vector(-3425.803711, -144.381561, 20.551086),
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
