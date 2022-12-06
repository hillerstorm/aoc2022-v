module main

import os {
	exists,
	read_file,
	write_file,
}
import net.http { fetch }

fn get_input(day int) !string {
	input_path := 'inputs/${day}.txt'
	if exists(input_path) {
		return read_file(input_path)!
	}

	println('Input file not found, downloading...')
	if !exists('.session') {
		return error('No .session file found, save value from Cookie header on your aoc page')
	}

	session := read_file('.session')!
	res := fetch(
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

	write_file(input_path, res.body)!

	return res.body
}
