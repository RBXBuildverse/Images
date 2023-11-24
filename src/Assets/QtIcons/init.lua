--- Qt: Roblox Studio Qt Resources
--- omwot

local Util = require(script.Parent.Parent.Util)

local Qt = {}

for _, AssetMap in script:GetChildren() do
	AssetMap = require(AssetMap)

	Util.merge(Qt, AssetMap.Assets.Qt)
end

return Qt