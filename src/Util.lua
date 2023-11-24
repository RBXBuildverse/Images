--- Util: Utility for asset management
--- omwot

local Util = {}

function Util.merge(t: table, ...: table)

	for _, SubTable in {...} do
		for Key, Value in SubTable do

			local Target = t[Key]

			-- Merge subtables
			if Target and typeof(Target) == 'table' and typeof(Value) == 'table' then
				Util.merge(Target, Value)
			elseif Target then
				Target[Key] = Value
			else
				t[Key] = Value
			end
		end
	end
end

return Util