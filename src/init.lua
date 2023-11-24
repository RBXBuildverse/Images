--- Images: Images library
--- omwot

--[[
	MIT License

	Copyright (c) 2023 omwot

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
]]

local Types = require(script.Types)
local ImageSet = require(script.ImageSet)

local Images = {

	--- Container for sets
	Sets = {}
}

local function RegisterBuiltInSets()
	local Assets = script:WaitForChild('Assets')

	-- Qt icons
	Images:RegisterImageSet('Qt', require(Assets:WaitForChild('QtIcons')))
end

--- Returns a table describing an image
function Images:GetAsset(Path: string): Types.ImageData

	-- Get set and image path
	local SetName, ImagePath = Path:match('(.+)://(.+)')

	-- If this is a roblox asset, return it instead
	if SetName == 'rbxasset' or SetName == 'rbxassetid' then
		return {
			Image = Path,
		}
	end

	-- Use internal set
	local Set = self.Sets[SetName]

	return Set:GetAsset(ImagePath)
end

--- Returns an image if it exists
function Images:GetAssetIfExists(Path: string)

	local GotAsset, Asset = pcall(self.GetAsset, self, Path)

	if GotAsset then
		return Asset
	else
		return nil, Asset
	end
end

--- Registers an image set
function Images:RegisterImageSet(SetName: string, SetImages: Types.ImageSetImages)

	-- Create a new set with these images
	local Set = ImageSet.new(SetName, SetImages)

	-- Register the set
	self.Sets[SetName] = Set

	return self
end

-- Register built in sets
RegisterBuiltInSets()

return Images