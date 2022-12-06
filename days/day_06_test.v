module days

fn test_day_six() {
	tests := [
		TestFixture{read_input(6, 1), '7', '19'},
		TestFixture{read_input(6, 2), '5', '23'},
		TestFixture{read_input(6, 3), '6', '23'},
		TestFixture{read_input(6, 4), '10', '29'},
		TestFixture{read_input(6, 5), '11', '26'},
	]
	for test in tests {
		part_one, part_two := day_six(test.buffer) or { panic(err) }
		assert part_one == test.expected_part_one
		assert part_two == test.expected_part_two
	}
}
