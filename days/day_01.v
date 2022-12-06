module days

import arrays { max, sum }
import strconv { atoi }

pub fn day_one(input string) !(string, string) {
	mut mapped_elves := input.split('\n\n')
		.map(sum(it.split_into_lines()
			.map(atoi(it)!))!)

	mapped_elves.sort(b < a)
	part_one := max(mapped_elves)!
	part_two := sum(mapped_elves[..3])!

	return part_one.str(), part_two.str()
}
