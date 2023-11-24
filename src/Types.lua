--- Types: Types for luau typing
--- omwot

export type ImageData = {
	Image: string,
	ImageRectOffset: Vector2?,
	ImageRectSize: Vector2?,
	[string]: any?,
}

export type ImageSetImages = {
	[string]: ImageData | ImageSetImages
}

return {}