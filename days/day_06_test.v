module days

fn test_day_six() {
	run_tests(day_six, [
		TestFixture{'mjqjpqmgbljsphdztnvjfqwrcgsmlb', '7', '19'},
		TestFixture{'bvwbjplbgvbhsrlpgdmjqwftvncz', '5', '23'},
		TestFixture{'nppdvjthqldpwncqszvftbrmjlhg', '6', '23'},
		TestFixture{'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg', '10', '29'},
		TestFixture{'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw', '11', '26'},
	])
}
