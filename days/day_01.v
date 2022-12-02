module days

import arrays
import strconv

pub fn day_one(input string) !(string, string) {
	mut mapped_elves := input.split('\n\n').map(fn (elf string) int {
		return arrays.sum(elf.split_into_lines().map(fn (cals string) int {
			return strconv.atoi(cals) or { 0 }
		})) or { 0 }
	})

	mapped_elves.sort(b < a)
	part_one := arrays.max(mapped_elves)!
	part_two := arrays.sum(mapped_elves[..3])!

	return part_one.str(), part_two.str()
}
