# Images
Image asset library for Roblox

## Usage
Here is example usage for the library
```lua

local Images = require(game:GetService('ReplicatedStorage').Packages.Images)
local MyImageLabel = Instance.new('ImageLabel', game:GetService('StarterGui'))

-- You can find availible
local ImageData = Images:GetAsset('Qt://icons/Dark/Roblox/16/1x/Placeholder')
MyImageLabel.Image = ImageData.Image

-- It is important to note that `ImageRectOffset` and `ImageRectSize` may be `nil`
MyImageLabel.ImageRectOffset = ImageData.ImageRectOffset or Vector2.new()
MyImageLabel.ImageRectSize = ImageData.ImageRectSize or Vector2.new()

-- You can also iterate through the data, however, the above method is preferred.
for Property, Value in ImageData do
  MyImageLabel[Property] = Value
end
```

## Adding your own sets
You can add your own sets using `Images:RegisterImageSet()`.
```lua
local Images = require(game:GetService('ReplicatedStorage').Packages.Images)

-- This will create a set that can be accessed with a `MySet://` prefix
Images:RegisterImageSet('MySet', {
	AnimalImages = {

		-- Access using `Images:GetAsset('MySet://AnimalImages/DuckImage')`
		DuckImage = {
			Image = 'rbxassetid://123456',
			ImageRectOffset = Vector2.new(12, 34),
			ImageRectSize = Vector2.new(32, 32),
		},

		-- Access using `Images:GetAsset('MySet://AnimalImages/DogImage')`
		DogImage = {
			Image = 'rbxassetid://665544332211',
			ImageRectOffset = Vector2.new(43, 21),
			ImageRectSize = Vector2.new(32, 32),
		},
	}

	-- Access using `Images:GetAsset('MySet://SmileFaceImage')`
	SmileFaceImage = {
		Image = 'rbxasset://textures/face.png',
		-- ImageRectOffset and ImageRectSize can be omitted
	}
})

-- We can now access the assets
print(Images:GetAsset('MySet://AnimalImages/DuckImage').Image) --> rbxassetid://123456
print(Images:GetAsset('MySet://AnimalImages/DogImage').Image) --> rbxassetid://665544332211
print(Images:GetAsset('MySet://SmileFaceImage').Image) --> rbxasset://textures/face.png

```