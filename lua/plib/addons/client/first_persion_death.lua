plib.Require( 'player_eyes' )

local player_eyes_EyeAngles = player_eyes.EyeAngles
local player_eyes_eyePos = player_eyes.EyePos
local IsValid = IsValid

hook.Add('CalcView', 'First Persion Death', function( ply, pos, ang )
    if ply:Alive() then return end
    if (ply:GetViewEntity() == ply) and (ply:GetObserverTarget() ~= ply) then
        local ragdoll = ply:GetRagdollEntity()
        if IsValid( ragdoll ) then
            return {
                ['origin'] = player_eyes_eyePos( ragdoll, pos ),
                ['angles'] = player_eyes_EyeAngles( ragdoll, ang )
            }
        end
    end
end)