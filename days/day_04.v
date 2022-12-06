module days

pub fn day_four(input string) !(string, string) {
	pairs := input.split_into_lines()
		.map(it.split(',').map(it.split('-')))
		.map([
			range(it[0][0].int(), it[0][1].int()),
			range(it[1][0].int(), it[1][1].int()),
		])

	mut part_one := 0
	mut part_two := 0

	for pair in pairs {
		if pair[0].all(it in pair[1]) || pair[1].all(it in pair[0]) {
			part_one += 1
			part_two += 1
			continue
		} else if pair[0].any(it in pair[1]) || pair[1].any(it in pair[0]) {
			part_two += 1
		}
	}

	return part_one.str(), part_two.str()
}
