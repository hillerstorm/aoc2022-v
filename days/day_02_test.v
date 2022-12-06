module days

fn test_day_two() ! {
	tests := [
		TestFixture{read_input(2, 1), '15', '12'},
	]
	for test in tests {
		part_one, part_two := day_two(test.buffer) or { panic(err) }
		assert part_one == test.expected_part_one
		assert part_two == test.expected_part_two
	}
}
