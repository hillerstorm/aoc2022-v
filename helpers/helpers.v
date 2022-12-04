module helpers

pub fn range(from int, to int) []int {
	return []int{len: (to - from) + 1, init: it + from}
}
