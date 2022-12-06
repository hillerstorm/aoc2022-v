module days

pub fn day_six(input string) !(string, string) {
	mut start_of_packet := []rune{}
	mut start_of_message := []rune{}

	mut part_one := -1
	mut part_two := -1

	for i, chr in input.trim_space().runes() {
		if part_one == -1 {
			if check_marker(mut start_of_packet, chr, 4) {
				part_one = i + 1

				if part_two > -1 {
					break
				}
			}
		}

		if part_two == -1 {
			if check_marker(mut start_of_message, chr, 14) {
				part_two = i + 1

				if part_one > -1 {
					break
				}
			}
		}
	}

	return part_one.str(), part_two.str()
}

fn check_marker(mut marker []rune, chr rune, marker_length int) bool {
	if chr in marker {
		marker.delete_many(0, marker.index(chr) + 1)
	}

	marker << chr

	return marker.len == marker_length
}
