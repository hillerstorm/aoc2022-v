module days

fn test_day_fifteen() {
	tests := [
		TestFixture{read_input(day: 15), '26', '56000011'},
	]

	for test in tests {
		part_one, part_two := day_fifteen_for_row(test.buffer, 10) or { panic(err) }
		assert part_one == test.expected_part_one
		assert part_two == test.expected_part_two
	}
}
