import Foundation

// NOTE: There are 4 pages in this playground.
// There are a total of 4 questions, each on a separate page.

// Use a GCD queue(s) (DispatchQueue) to execute functions a, b, and c in  the following order:

// first a serially
// then  b serially
// then  a and b concurrently
// then c serially

//   a
//   |
//   b
//  / \
// a   b
//  \ /
//   c

func slow(id: String) {
    print("\(id) has started")
    for i in 0..<3 {
        Thread.sleep(forTimeInterval: 1.0)
        print("\(id) tick \(i + 1)/3")
    }
    print("\(id) has completed")
}

func a() { slow(id: "a") }
func b() { slow(id: "b") }
func c() { slow(id: "c") }

// Example of a valid output:

/*
a has started
a tick 1/3
a tick 2/3
a tick 3/3
a has completed
b has started
b tick 1/3
b tick 2/3
b tick 3/3
b has completed
a has started
b has started
a tick 1/3
b tick 1/3
a tick 2/3
b tick 2/3
b tick 3/3
a tick 3/3
a has completed
b has completed
c has started
c tick 1/3
c tick 2/3
c tick 3/3
c has completed
*/


