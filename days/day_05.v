module days

import regex
import datatypes as dt

pub fn day_five(input string) !(string, string) {
	parts := input.split('\n\n')
	setup := parts[0].split_into_lines().reverse()
	rows := setup[1..]

	mut indices := []int{}
	for i, chr in setup[0] {
		if chr != ` ` {
			indices << i
		}
	}

	mut part_one := []dt.Stack[rune]{len: indices.len, init: dt.Stack[rune]{}}
	mut part_two := [][]rune{len: indices.len, init: []rune{}}

	for row in rows {
		for i, index in indices {
			if chr := row[index] {
				if chr != ` ` {
					part_one[i].push(chr)
					part_two[i] << chr
				}
			}
		}
	}

	query := r'^move (\d+) from (\d+) to (\d+)$'
	for move in parts[1].split_into_lines() {
		mut re := regex.regex_opt(query) or { return error('invalid move: ${move}') }
		_, _ := re.match_string(move)
		groups := re.get_group_list()

		amount := move[groups[0].start..groups[0].end].int()
		from := move[groups[1].start..groups[1].end].int() - 1
		to := move[groups[2].start..groups[2].end].int() - 1

		for _ in 0 .. amount {
			part_one[to].push(part_one[from].pop()!)
		}

		part_two[to] << part_two[from]#[-amount..]
		part_two[from].trim(part_two[from].len - amount)
	}

	return part_one.map(it.peek()!).string(), part_two.map(it.last()).string()
}
