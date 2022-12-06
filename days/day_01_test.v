module days

fn test_day_one() ! {
	tests := [
		TestFixture{read_input(1, 1), '24000', '45000'},
	]
	for test in tests {
		part_one, part_two := day_one(test.buffer) or { panic(err) }
		assert part_one == test.expected_part_one
		assert part_two == test.expected_part_two
	}
}
