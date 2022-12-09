module days

fn test_day_nine() {
	run_tests(day_nine, [
		TestFixture{read_input(day: 9, version: 1), '13', '1'},
		TestFixture{read_input(day: 9, version: 2), '88', '36'},
	])
}
