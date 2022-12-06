module days

fn test_day_five() ! {
	tests := [
		TestFixture{read_input(5, 1), 'CMZ', 'MCD'},
	]
	for test in tests {
		part_one, part_two := day_five(test.buffer) or { panic(err) }
		assert part_one == test.expected_part_one
		assert part_two == test.expected_part_two
	}
}
