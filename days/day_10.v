module days

import arrays { flat_map }

pub fn day_ten(input string) !(string, string) {
	instructions := flat_map[string, int](input.trim_space().split_into_lines(), map_instruction)

	mut sprite_pos := 1

	mut part_one := 0
	mut part_two := '\n'

	for i, instruction in instructions {
		if i == 19 || (i - 19) % 40 == 0 {
			part_one += (i + 1) * sprite_pos
		}

		if i % 40 in [sprite_pos - 1, sprite_pos, sprite_pos + 1] {
			part_two += '#'
		} else {
			part_two += '.'
		}
		if (i + 1) % 40 == 0 {
			part_two += '\n'
		}

		sprite_pos += instruction
	}

	return part_one.str(), part_two
}

fn map_instruction(line string) []int {
	parts := line.split(' ')
	match parts[0] {
		'addx' {
			return [0, parts[1].int()]
		}
		else {
			return [0]
		}
	}
}
