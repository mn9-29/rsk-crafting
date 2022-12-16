Config = {}
--------------------------------------------- [Crafting] ---------------------------------------------

Config.imagesize1 = "194px" -- Weapon picture size
Config.imagesize2 = "150px" -- The size of the image images
Config.color1 = "rgb(91, 91, 91)" -- Crafting button color || Main Color Of Button : #1998bd
Config.color2 = "#000000" -- Color of the night || Main Color Of Level : #1fef72c9
Config.CameraAnimationTime = 1100 -- camera animation time: 1000 = 1 second
Config.PromptKey = 0xE30CD707 -- R

Config.ModelSpawns = {
    ["craftweapon"] = {
        ["coords"] = vector3(2927.31, 547.14, 45.76),
        ["heading"] = 250.55810546875,
        ["model"] = `mes_finale2_males_01`,
    },
	["craftammo"] = {
        ["coords"] = vector3(2931.81, 528.82, 45.33),
        ["heading"] = 209.39334106445,
        ["model"] = `mes_finale2_males_01`,
    },
	["craftitems"] = {
        ["coords"] = vector3(-3674.74, -2587.57, -13.74),
        ["heading"] = 171.12217712402,
        ["model"] = `mes_finale2_males_01`,
    },
}

Config.Items = { -- Items Crafting
	[1] = {
		item = 'water',
		Level = 0, -- item level
		ExperiancePerCraft = 0, -- add level
		info = "normal",
		img = "", -- link img (Keep it empty if you want to take it out of the bag automatically)
		Ingredients = { -- Item Requirements
		    [1] = {item = "bread", amount = 5},
			[2] = {item = "carrot", amount = 2},
		}
	},
}

Config.Weapons = { -- Weapons Crafting
	[1] = {
		item = 'weapon_rifle_springfield',
		Level = 0, -- item level
		ExperiancePerCraft = 0, -- add level
		info = "very powerful",
		img = "", -- link img (Keep it empty if you want to take it out of the bag automatically)
		Ingredients = { -- Item Requirements
		    [1] = {item = "bread", amount = 5},
			[2] = {item = "carrot", amount = 2},
		}
	},
	[2] = {
		item = 'weapon_rifle_springfield',
		Level = 0, -- item level
		ExperiancePerCraft = 0, -- add level
		info = "very powerful",
		img = "", -- link img (Keep it empty if you want to take it out of the bag automatically)
		Ingredients = { -- Item Requirements
		    [1] = {item = "bread", amount = 5},
			[2] = {item = "carrot", amount = 2},
		}
	},
	[3] = {
		item = 'weapon_rifle_springfield',
		Level = 0, -- item level
		ExperiancePerCraft = 0, -- add level
		info = "very powerful",
		img = "", -- link img (Keep it empty if you want to take it out of the bag automatically)
		Ingredients = { -- Item Requirements
		    [1] = {item = "bread", amount = 5},
			[2] = {item = "carrot", amount = 2},
		}
	},
	[4] = {
		item = 'weapon_rifle_springfield',
		Level = 0, -- item level
		ExperiancePerCraft = 0, -- add level
		info = "very powerful",
		img = "", -- link img (Keep it empty if you want to take it out of the bag automatically)
		Ingredients = { -- Item Requirements
		    [1] = {item = "bread", amount = 5},
			[2] = {item = "carrot", amount = 2},
		}
	},
	[5] = {
		item = 'weapon_rifle_springfield',
		Level = 0, -- item level
		ExperiancePerCraft = 0, -- add level
		info = "very powerful",
		img = "", -- link img (Keep it empty if you want to take it out of the bag automatically)
		Ingredients = { -- Item Requirements
		    [1] = {item = "bread", amount = 5},
			[2] = {item = "carrot", amount = 2},
		}
	},
	[6] = {
		item = 'weapon_rifle_springfield',
		Level = 0, -- item level
		ExperiancePerCraft = 0, -- add level
		info = "very powerful",
		img = "", -- link img (Keep it empty if you want to take it out of the bag automatically)
		Ingredients = { -- Item Requirements
		    [1] = {item = "bread", amount = 5},
			[2] = {item = "carrot", amount = 2},
		}
	},
	[7] = {
		item = 'weapon_rifle_springfield',
		Level = 0, -- item level
		ExperiancePerCraft = 0, -- add level
		info = "very powerful",
		img = "", -- link img (Keep it empty if you want to take it out of the bag automatically)
		Ingredients = { -- Item Requirements
		    [1] = {item = "bread", amount = 5},
			[2] = {item = "carrot", amount = 2},
		}
	},
	[8] = {
		item = 'weapon_rifle_springfield',
		Level = 0, -- item level
		ExperiancePerCraft = 0, -- add level
		info = "very powerful",
		img = "", -- link img (Keep it empty if you want to take it out of the bag automatically)
		Ingredients = { -- Item Requirements
		    [1] = {item = "bread", amount = 5},
			[2] = {item = "carrot", amount = 2},
		}
	},
	[9] = {
		item = 'weapon_rifle_springfield',
		Level = 0, -- item level
		ExperiancePerCraft = 0, -- add level
		info = "very powerful",
		img = "", -- link img (Keep it empty if you want to take it out of the bag automatically)
		Ingredients = { -- Item Requirements
		    [1] = {item = "bread", amount = 5},
			[2] = {item = "carrot", amount = 2},
		}
	},
	[10] = {
		item = 'weapon_rifle_springfield',
		Level = 0, -- item level
		ExperiancePerCraft = 0, -- add level
		info = "very powerful",
		img = "", -- link img (Keep it empty if you want to take it out of the bag automatically)
		Ingredients = { -- Item Requirements
		    [1] = {item = "bread", amount = 5},
			[2] = {item = "carrot", amount = 2},
		}
	},
}

Config.ammo = { -- Items Crafting
	[1] = {
		item = 'ammo_pistol',
		Level = 0, -- item level
		ExperiancePerCraft = 0, -- add level
		info = "normal",
		img = "", -- link img (Keep it empty if you want to take it out of the bag automatically)
		Ingredients = { -- Item Requirements
		    [1] = {item = "bread", amount = 5},
			[2] = {item = "carrot", amount = 2},
		}
	},
}

Config.Locations = {
    ["craftweapon"] = {
        [1] = vector3(2930.56, 545.24, 45.24), -- craftweapon
    },
    ["craftitems"] = {
        [2] = vector3(-3675.55, -2588.93, -14.07), -- craftitems
    },
    ["craftammo"] = {
        [3] = vector3(2933.52, 525.98, 45.26), -- craftammo
    },
}