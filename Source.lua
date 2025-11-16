local Players = game:GetService("Players")

local brainrot = script.Parent  -- el modelo del brainrot
local hitbox = brainrot:WaitForChild("PrimaryPart") -- o "Hitbox" si usas otra parte

hitbox.Touched:Connect(function(hit)
    local char = hit.Parent
    if not char then return end

    local player = Players:GetPlayerFromCharacter(char)
    if not player then return end

    -- Buscar la base del jugador
    local base = workspace.Bases:FindFirstChild(player.Name)
    if not base then
        warn("No se encontró la base del jugador:", player.Name)
        return
    end

    local spawnPoint = base:FindFirstChild("Spawn")
    if not spawnPoint then
        warn("No se encontró el Spawn en la base de:", player.Name)
        return
    end

    -- Teletransportar al jugador
    if char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = spawnPoint.CFrame + Vector3.new(0, 3, 0)
    end
end)
