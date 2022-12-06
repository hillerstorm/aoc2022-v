module days

fn test_day_four() ! {
	tests := [
		TestFixture{read_input(4, 1), '2', '4'},
	]
	for test in tests {
		part_one, part_two := day_four(test.buffer) or { panic(err) }
		assert part_one == test.expected_part_one
		assert part_two == test.expected_part_two
	}
}
