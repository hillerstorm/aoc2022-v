module days

import os

struct TestFixture {
	buffer            string
	expected_part_one string
	expected_part_two string
}

fn read_input(day int, version int) string {
	input_path := 'days/test_inputs/day_${day:02}_${version:02}.txt'

	if os.exists(input_path) {
		return os.read_file(input_path) or { panic(err) }
	}

	panic('invalid input file: ${input_path}')
}
