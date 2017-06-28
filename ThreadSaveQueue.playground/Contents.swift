import Foundation

class Queue<T> {
    
    // threadsafe fifo
    private let lock = DispatchQueue(label: "lockQueue")
    private var _fifo = [T]()
    
    fileprivate var fifo: [T] {
        get {
            return lock.sync {
                return self._fifo
            }
        }
        set {
            lock.sync {
                _fifo = newValue
            }
        }
    }
    
    public func push(_ newItem: T) {
        fifo.append(newItem)
    }
    
    public func pop() -> T? {
        return fifo.isEmpty ? nil : fifo.removeFirst()
    }
    
}

extension Queue {
    public var isEmpty: Bool {
        return fifo.isEmpty
    }
    
    public var count: Int {
        return fifo.count
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return fifo.description
    }
}

// smoke test
let queue = Queue<Int>()
queue.push(3)
queue.push(4)

queue.pop()
queue.pop()
queue.pop()


// load test
var push = 0
var pop = 0

for _ in 1...1000 {

    DispatchQueue.global().async {
        queue.push(1)
        push += 1
    }
    
    DispatchQueue.global().async {
        queue.pop()
        pop += 1
    }
}

sleep(2)

push
pop

sleep(2)



