module days

import arrays
import strconv

pub fn day_one(input string) !(string, string) {
	mut mapped_elves := arrays.map_indexed(input.split('\n\n'), fn (_ int, elf string) int {
		return arrays.sum(arrays.map_indexed(elf.split_into_lines(), fn (_ int, cals string) int {
			return strconv.atoi(cals) or { 0 }
		})) or { 0 }
	})

	mapped_elves.sort(b < a)
	part_one := arrays.max(mapped_elves)!
	part_two := arrays.sum(mapped_elves[..3])!

	return part_one.str(), part_two.str()
}
