module days

import math { abs }

const deltas = {
	'L': [-1, 0]
	'R': [1, 0]
	'U': [0, -1]
	'D': [0, 1]
}

struct Pos {
	x int
	y int
}

pub fn day_nine(input string) !(string, string) {
	moves := input.trim_space().split_into_lines().map(it.split(' '))

	mut visited_by_tail := {
		'0_0': true
	}
	mut visited_by_second := {
		'0_0': true
	}
	mut rope_positions := []Pos{len: 10, init: Pos{0, 0}}

	for move in moves {
		dxy := days.deltas[move[0]]
		len := move[1].int()

		for _ in 0 .. len {
			mut current_pos := rope_positions[0]
			current_pos = Pos{
				x: current_pos.x + dxy[0]
				y: current_pos.y + dxy[1]
			}

			rope_positions[0] = current_pos
			for i, pos in rope_positions[1..] {
				mut new_pos := pos

				dy := abs(current_pos.y - new_pos.y) == 2
				dx := abs(current_pos.x - new_pos.x) == 2

				if dy && dx {
					new_pos = Pos{
						x: new_pos.x + ((current_pos.x - new_pos.x) / 2)
						y: new_pos.y + ((current_pos.y - new_pos.y) / 2)
					}
				} else if dy {
					new_pos = Pos{
						x: current_pos.x
						y: new_pos.y + ((current_pos.y - new_pos.y) / 2)
					}
				} else if dx {
					new_pos = Pos{
						x: new_pos.x + ((current_pos.x - new_pos.x) / 2)
						y: current_pos.y
					}
				}

				current_pos = new_pos
				rope_positions[i + 1] = new_pos
			}

			visited_by_tail['${rope_positions[9].x}_${rope_positions[9].y}'] = true
			visited_by_second['${rope_positions[1].x}_${rope_positions[1].y}'] = true
		}
	}

	return visited_by_second.len.str(), visited_by_tail.len.str()
}
