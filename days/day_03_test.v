module days

fn test_day_three() ! {
	tests := [
		TestFixture{read_input(3, 1), '157', '70'},
	]
	for test in tests {
		part_one, part_two := day_three(test.buffer) or { panic(err) }
		assert part_one == test.expected_part_one
		assert part_two == test.expected_part_two
	}
}
