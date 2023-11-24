--- ImageSet: ImageSet class
--- omwot

local Types = require(script.Parent.Types)

local ImageSet = {} :: ImageSet
ImageSet.__index = ImageSet

export type ImageSet = typeof(ImageSet.new({}))

--- Returns a new image set
function ImageSet.new(Name: string, Images: Types.ImageSetImages)

	local self = setmetatable({}, ImageSet)
	self._Images = Images

	return self
end

--- Returns image data for the provided image path
function ImageSet:GetAsset(ImagePath: string): Types.ImageData

	-- Solve the path
	local Target = self._Images
	for _, PathBranch in ImagePath:split('/') do

		-- Continue on to the next path branch
		Target = Target[PathBranch]

		-- Ensure the target exists
		if not Target then
			error(`{PathBranch} was not found in image set {self.Name} using path {ImagePath}`)
		end
	end

	return Target
end

return ImageSet