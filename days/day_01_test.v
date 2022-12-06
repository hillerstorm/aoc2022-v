module days

fn test_day_one() {
	run_tests(day_one, [
		TestFixture{read_input(day: 1), '24000', '45000'},
	])
}
