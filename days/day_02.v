module days

const results = {
	'A': {
		'X': [3 + 1, 3 + 0]
		'Y': [6 + 2, 1 + 3]
		'Z': [0 + 3, 2 + 6]
	}
	'B': {
		'X': [0 + 1, 1 + 0]
		'Y': [3 + 2, 2 + 3]
		'Z': [6 + 3, 3 + 6]
	}
	'C': {
		'X': [6 + 1, 2 + 0]
		'Y': [0 + 2, 3 + 3]
		'Z': [3 + 3, 1 + 6]
	}
}

pub fn day_two(input string) !(string, string) {
	mut part_one := 0
	mut part_two := 0

	for game in input.split_into_lines() {
		parts := game.split(' ')
		if parts.len != 2 {
			continue
		}
		points := days.results[parts[0]][parts[1]]
		part_one += points[0]
		part_two += points[1]
	}

	return part_one.str(), part_two.str()
}
