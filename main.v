module main

import os
import strconv { atoi }
import time {
	parse,
	utc,
}
import days {
	day_five,
	day_four,
	day_one,
	day_six,
	day_three,
	day_two,
}

fn main() {
	days := [
		day_one,
		day_two,
		day_three,
		day_four,
		day_five,
		day_six,
	]

	now := utc()
	mut day := 0
	if os.args.len == 1 {
		println('No day given, trying latest')
		max := parse('2022-12-25 05:00:00') or {
			println(err)
			return
		}
		if max < now {
			day = 25
		} else {
			day = now.day
		}
	} else {
		day = atoi(os.args[1]) or {
			println('Invalid input, must be a valid number ${err}')
			return
		}
	}

	then := parse('2022-12-${day} 05:00:00') or {
		println(err)
		return
	}

	if now < then {
		println('Day ${day} can\'t be started yet, ${then - now} left')
		return
	}

	input := get_input(day) or {
		println(err)
		return
	}

	if day > days.len {
		println('No code has been written for day ${day} yet')
		return
	}

	fun := days[day - 1]
	part_one, part_two := fun(input) or {
		println(err)
		return
	}

	println('[Day ${day}]')
	println('Part one: ${part_one}')
	println('Part two: ${part_two}')
}
