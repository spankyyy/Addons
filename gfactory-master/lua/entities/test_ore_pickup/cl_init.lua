include("shared.lua")
function ENT:Draw()
    self:DrawModel()
--[[
    local ent = LocalPlayer():GetEyeTrace().Entity
    if ent ~= self then return end
    local closeEnough = LocalPlayer():GetEyeTrace().Fraction * (2 ^ 15) < 128
    if not closeEnough then return end
    local Flsh = math.Remap((SysTime() * 16) % 1, 0, 1, 0.8, 1)
    local pos = self:WorldSpaceCenter() + Vector(0, 0, 16 + (Flsh * 0.5))
    --local plyPos = Vector(plyPos.x, plyPos.y)
    local ang = EyeAngles()
    local ang = Angle(0, -90 + ang.y, 90)

    cam.Start3D2D(pos, ang, 0.1)
        render.OverrideDepthEnable(false, true)
        local Flsh = math.Remap(math.sin(SysTime() * 128), -1, 1, 0.8, 1)
        local Quantity = self:GetCL_Quantity()
        draw.SimpleTextOutlined(self.PrintName .. " (" .. Quantity .. "x)", "GF_interactable", 0, 0, Color(255 * Flsh, 255 * Flsh, 128 * Flsh), 1, 1, 1, Color(0, 0, 0))
        --render.OverrideDepthEnable(true, true)
    cam.End3D2D()
    ]]
end

function ENT:InteractDraw()
    local selfScreenCoord = (self:WorldSpaceCenter() + Vector(0, 0, 16)):ToScreen()
    surface.SetDrawColor(255, 255, 255)
    --surface.DrawRect(selfScreenCoord.x - 2, selfScreenCoord.y - 2, 4, 4)
    local Flsh = math.Remap(math.sin(SysTime() * 128), -1, 1, 0.8, 1)
    local Quantity = self:GetCL_Quantity()
    draw.SimpleTextOutlined(self.PrintName .. " (" .. Quantity .. "x)", "GF_interactable3", selfScreenCoord.x, selfScreenCoord.y, Color(255 * Flsh, 255 * Flsh, 128 * Flsh), 1, 1, 1, Color(0, 0, 0))
end
