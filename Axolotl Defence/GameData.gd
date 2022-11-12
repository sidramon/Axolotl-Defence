extends Node

var tower_data = {
	"Leucistique": {
		"damage": 5,
		"rof": 1.5,
		"range": 300,
		"cost": 8},
		
	"Axanthique": {
		"damage": 4,
		"rof": 2,
		"range": 240,
		"cost": 9},
		
	"Copper": {
		"damage": 8,
		"rof": 2,
		"range": 300,
		"cost": 14},
	
	"Melanique": {
		"damage": 16,
		"rof": 2.5,
		"range": 230,
		"cost": 22}
}

var fish_data = {
	"RedFish": {
		"speed": 120,
		"life": 5,
		"strength": 1,
		"value": 1
	},
	"BlueFish": {
		"speed": 130,
		"life": 10,
		"strength": 2,
		"value": 2
	},
	"GreenFish": {
		"speed": 145,
		"life": 15,
		"strength": 3,
		"value": 3
	},
	"OrangeFish": {
		"speed": 135,
		"life": 20,
		"strength": 4,
		"value": 4
	},
	"PurpleFish": {
		"speed": 150,
		"life": 25,
		"strength": 5,
		"value": 5
	},
	"PufferFish": {
		"speed": 105,
		"life": 60,
		"strength": 18,
		"value": 10
	},
	"BossFish": {
		"speed": 90,
		"life": 150,
		"strength": 20,
		"value": 20
	}
}

var rounds = [
	[ # Round 1
		["RedFish", 0.6], ["RedFish", 0.3], ["RedFish", 0.9]
	],
	[ # Round 2
		["BlueFish", 0.0], ["RedFish", 0.3], ["RedFish", 0.6], 
		["RedFish", 0.9]
	],
	[ # Round 3
		["BlueFish", 0.0], ["RedFish", 0.6], ["RedFish", 0.3], 
		["RedFish", 0.6], ["BlueFish", 0.9]
	],
	[ # Round 4
		["RedFish", 0.0], ["GreenFish", 0.0], ["BlueFish", 0.6], 
		["RedFish", 0.3]
	],
	[ # Round 5
		["GreenFish", 0.0], ["GreenFish", 0.9], ["BlueFish", 0.0], 
		["GreenFish", 0.4]
	],
	[ # Round 6
		["RedFish", 0.6], ["RedFish", 0.3], ["RedFish", 0.9],
		["RedFish", 0.2], ["RedFish", 0.8], ["RedFish", 0.5],
		["OrangeFish", 0.0]
	],
	[ # Round 7
		["BlueFish", 0.1], ["BlueFish", 0.7], ["BlueFish", 0.2],
		["BlueFish", 0.5], ["OrangeFish", 0.0]
	],
	[ # Round 8
		["OrangeFish", 0.1], ["OrangeFish", 0.8], ["OrangeFish", 0.3],
		["PurpleFish", 0.0]
	],
	[ # Round 9
		["PurpleFish", 0.0], ["GreenFish", 0.4], ["PurpleFish", 0.9],
		["OrangeFish", 0.8], ["OrangeFish", 0.3]
	],
	[ # Round 10
		["PufferFish", 0.0], ["PurpleFish", 0.9], ["OrangeFish", 0.3],
		["GreenFish", 0.4], ["GreenFish", 0.7]
	],
	[ # Round 11
		["PufferFish", 0.0], ["PurpleFish", 0.9], ["PurpleFish", 0.0], 
		["PurpleFish", 0.9], ["OrangeFish", 0.0], ["OrangeFish", 0.3]
	],
	[ # Round 12

	],
	[ # Round 13

	]
]
