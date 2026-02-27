ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.Spawnable = false

ENT.Model = Model( "models/props_phx/rt_screen.mdl" )

ENT.MediaPlayerType = "entity"
ENT.IsMediaPlayerEntity = true

local ErrorModel = "models/error.mdl"

function ENT:Initialize()

	if SERVER then
		if self:GetModel() == ErrorModel then
			self:SetModel( self.Model )
		end

		self:SetUseType( SIMPLE_USE )

		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )

		local phys = self:GetPhysicsObject()
		if IsValid( phys ) then
			phys:EnableMotion( false )
		end

		-- Install media player to entity
		local mp = self:InstallMediaPlayer( self.MediaPlayerType )

		-- Network media player ID
		self:SetMediaPlayerID( mp:GetId() )

		timer.Simple(0, function()
			if not IsValid(self) then return end
			if self.CPPIGetOwner and self:CPPIGetOwner() and self:CPPIGetOwner():IsPlayer() then
				-- Attach mixin methods to self
				for k, v in pairs(DestructibleMixin) do self[k] = v end
				self.HealthAmount = RPrint.HpModifiers[self:GetClass()] or 1500
				self.CanCatchFire = true
				self.CanStartSparking = true
				self.ExplodeOnDestruct = true
				self:InitializeDestructible()
			end
		end)
	end

	-- Apply player config based on model
	self.PlayerConfig = self:GetMediaPlayerConfig()
end

function ENT:SetupDataTables()
	self:NetworkVar( "String", 0, "MediaPlayerID" )
end

function ENT:OnRemove()
	local mp = self:GetMediaPlayer()
	if mp then
		mp:Remove()
	end
end

function ENT:GetMediaPlayerConfig()
	local model = self:GetModel()
	local MPModelConfigs = list.Get( "MediaPlayerModelConfigs" )
	local config = MPModelConfigs and MPModelConfigs[model] or self.PlayerConfig
	return config
end
