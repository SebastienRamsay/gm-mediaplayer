DarkRP.createCategory {
	name = "Entertainment",
	categorises = "entities",
	startExpanded = true,
	color = Color(37, 29, 195),
	sortOrder = 0,
}

DarkRP.createCategory {
    name = "Entertainment",
    categorises = "jobs",
    startExpanded = true,
    color = Color(0, 0, 0),
    sortOrder = 0,
}

TEAM_CINEMA = DarkRP.createJob("Cinema Owner", {
    color = Color(14, 7, 136),
    model = "models/player/gman_high.mdl",
    description = [[
        Entertain the city with your amazing content.
    ]],
    weapons = {},
    command = "cinema",
    max = 2,
    salary = 440,
    admin = 0,
    vote = true,
    hasLicense = false,
    category = "Entertainment",
    canDemote = false,
})



DarkRP.createCategory {
	name = "Entertainment",
	categorises = "entities",
	startExpanded = true,
	color = Color(37, 29, 195),
	sortOrder = 0,
}

DarkRP.createEntity("Big Screen TV", {
	ent = "mediaplayer_tv",
	model = "models/gmod_tower/suitetv_large.mdl",
	description = [[A Big Screen TV to watch all your favourite shows.]],
	price = 5000,
	max = 1,
	cmd = "buytv",
	category = "Entertainment",
})

DarkRP.createEntity("Small TV", {
	ent = "mediaplayer_small_tv",
	model = "models/gmod_tower/suitetv_large.mdl",
	description = [[A Big Screen TV to watch all your favourite shows.]],
	price = 500,
	max = 1,
	cmd = "buysmalltv",
	category = "Entertainment",
})

DarkRP.createEntity("Cinema Screen", {
    ent = "mediaplayer_cinema",
    cmd = "buycinemascreen",
    model = "models/hunter/plates/plate5x8.mdl",
    price = 50000,
    max = 1,
    allowed = {
        TEAM_CINEMA
    },
    category = "Entertainment",
})
