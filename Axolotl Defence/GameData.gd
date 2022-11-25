extends Node

var score = 0;
var lastRound = 0

var tower_data = {
	"Leucistique": {
		"damage": 5,
		"rof": 1.5,
		"range": 150,
		"cost": 10,
		"color": "FFFFFF"},
		
	"Axanthique": {
		"damage": 4,
		"rof": 2,
		"range": 355,
		"cost": 12,
		"color": "4aabd1"},
		
	"Copper": {
		"damage": 8,
		"rof": 1.6,
		"range": 150,
		"cost": 14,
		"color": "481b1b"},
	
	"Melanique": {
		"damage": 24,
		"rof": 2.5,
		"range": 125,
		"cost": 22,
		"color": "000000"}
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
		"strength": 3,
		"value": 3
	},
	"PurpleFish": {
		"speed": 150,
		"life": 35,
		"strength": 5,
		"value": 4
	},
	"PufferFish": {
		"speed": 105,
		"life": 100,
		"strength": 15,
		"value": 5
	},
	"GrayFish": {
		"speed": 175,
		"life": 150,
		"strength": 18,
		"value": 6
	},
	"BossFish": {
		"speed": 90,
		"life": 750,
		"strength": 20,
		"value": 10
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
		["PufferFish", 0.5], ["PurpleFish", 0.9], ["PurpleFish", 0.1],
		["PurpleFish", 0.8], ["PurpleFish", 0.2], ["PurpleFish", 0.7],
		["PurpleFish", 0.3]
	],
	[ # Round 13
		["PufferFish", 0.5], ["PurpleFish", 0.8], ["PufferFish", 0.8],
		["PurpleFish", 0.8], ["PurpleFish", 0.2], ["PufferFish", 0.5],
		["OrangeFish", 0.0]
	],
	[ # Round 14
		["PurpleFish", 0.8], ["PurpleFish", 0.2],["PurpleFish", 0.1], 
		["PurpleFish", 0.9], ["PurpleFish", 0.4], ["PurpleFish", 0.7],
		["PufferFish", 0.5], ["PufferFish", 0.8]
	],
	[ # Round 15
		["PufferFish", 0.1], ["PufferFish", 0.9], ["PufferFish", 0.2],
		["PufferFish", 0.5]
	],
	[ # Round 16
		["GrayFish", 0.0], ["PurpleFish", 0.2], ["PurpleFish", 0.9]
	],
	[ # Round 17
		["GrayFish", 0.8], ["PufferFish", 0.1], ["PufferFish", 0.9],
		["PurpleFish", 0.2]
	],
	[ # Round 18
		["GrayFish", 0.0], ["GrayFish", 0.8], ["GrayFish", 0.8],
		["PufferFish", 0.1]
	],
	[ # Round 19
		["GrayFish", 0.0], ["PufferFish", 0.1], ["PurpleFish", 0.2],
		["PurpleFish", 0.9], ["PurpleFish", 0.3],["PurpleFish", 0.8],
		["GrayFish", 0.8]
	],
	[ # Round 20
		["BossFish", 0.0], ["RedFish", 0.9]
	]
]
