module main

import os
import time
import strconv
import net.http
import days

fn main() {
	days := [
		days.day_one,
		days.day_two,
		days.day_three,
	]

	now := time.utc()
	mut day := 0
	if os.args.len == 1 {
		println('No day given, trying latest')
		max := time.parse('2022-12-25 05:00:00') or {
			println(err)
			return
		}
		if max < now {
			day = 25
		} else {
			day = now.day
		}
	} else {
		day = strconv.atoi(os.args[1]) or {
			println('Invalid input, must be a valid number ${err}')
			return
		}
	}

	then := time.parse('2022-12-${day} 05:00:00') or {
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

fn get_input(day int) !string {
	input_path := 'inputs/${day}.txt'
	if os.exists(input_path) {
		return os.read_file(input_path)!
	}

	println('Input file not found, downloading...')
	if !os.exists('.session') {
		return error('No .session file found, save value from Cookie header on your aoc page')
	}

	session := os.read_file('.session')!
	res := http.fetch(
		method: .get
		url: 'https://adventofcode.com/2022/day/${day}/input'
		cookies: {
			'session': session
		}
	)!

	if res.body.len == 0 {
		return error('Empty input')
	}

	println('Downloaded input, saving to disk')

	os.write_file(input_path, res.body)!

	return res.body
}
