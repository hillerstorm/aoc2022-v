module days

import datatypes {Stack}
import regex { RE, regex_opt }

pub fn day_sixteen(input string) !(string, string) {
	query := r'^Valve ([A-Z]+) has flow rate=(\d+); tunnel[s]{0,1} lead[s]{0,1} to valve[s]{0,1} ([A-Z, ]+)$'
	mut re := regex_opt(query) or { return err }
lines := input.trim_space().split_into_lines().map(to_valve(it, mut re))
	valves := map_valves(lines)
	start := valves['AA']!
	mut valid_valves := lines.filter(it.rate > 0)

	mut stack := Stack[Valve]{}
	stack.push(start)

	for !stack.is_empty() {
		curr := stack.pop()!

		if lines.all(it.rate == 0) {
			break
		}

		neighbors := get_neighbours(curr, grid, width, height)
		for next in neighbors {
			if next in visited {
				continue
			}

			queue.push(next)
			visited[next] = curr
		}
	}

	return '', ''
}

fn map_valves(valves []&Valve) map[string]Valve {
	mut valve_map := map[string]Valve{}

	for valve in valves {
		valve_map[valve.name] = valve
	}

	return valve_map
}

struct Valve {
	name    string
	rate    int
	tunnels []string
}

fn to_valve(line string, mut re RE) &Valve {
	re.match_string(line)
	groups := re.get_group_list().map(line[it.start..it.end])
	name := groups[0]
	rate := groups[1].int()
	tunnels := groups[2].split(', ')
	return &Valve{name, rate, tunnels}
}
