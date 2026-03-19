DarkRP.createEntity("Big Screen TV", {
	ent = "mediaplayer_tv",
	model = "models/gmod_tower/suitetv_large.mdl",
	description = [[A Big Screen TV to watch all your favourite shows.]],
	price = 500,
	getMax = function(ply)
		return 1
	end,
	cmd = "buytv",
	category = "Entertainment",
})