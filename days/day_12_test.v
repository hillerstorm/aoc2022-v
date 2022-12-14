module days

fn test_day_twelve() {
	run_tests(day_twelve, [
		TestFixture{read_input(day: 12), '31', '29'},
	])
}
