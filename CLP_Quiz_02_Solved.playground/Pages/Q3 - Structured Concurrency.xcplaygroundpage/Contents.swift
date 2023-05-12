//: [Previous](@previous)

import Foundation

// Use a structured concurrency (async/await) to execute functions a, b, and c in  the following order:

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

func slow(id: String) async {
    print("\(id) has started")
    for i in 0..<3 {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        print("\(id) tick \(i + 1)/3")
    }
    print("\(id) has completed")
}

func a() async { await slow(id: "a") }
func b() async { await slow(id: "b") }
func c() async { await slow(id: "c") }

Task {
    await a()
    await b()
    
    await withTaskGroup(of: Void.self) { group in
        group.addTask {
            await a()
        }
        group.addTask {
            await b()
        }
        
    }
    await c()
}

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
 a tick 3/3
 a has completed
 b tick 3/3
 b has completed
 c has started
 c tick 1/3
 c tick 2/3
 c tick 3/3
 c has completed
*/
