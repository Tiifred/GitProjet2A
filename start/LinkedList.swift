public class LinkedListNode<T> {
	var value: T
	var next: LinkedListNode?
	public init(value: T) {
		self.value = value
	}
}

public class LinkedList<T> {
	public typealias Node = LinkedListNode<T>
	
	private var head: Node?
	
	public var isEmpty: Bool {
		return head == nil
	}
	
	public var first: Node? {
		return head
	}
	
	public var last: Node? {
		if var node = head {
			while case let next? = node.next {
				node = next
			}
			return node
		} else {
			return nil
		}
	}
	
	public var count: Int {
		if var node = head {
			var c = 1
			while case let next? = node.next {
				node = next
				c += 1
			}
			return c
		} else {
			return 0
		}
	}
	
	public func nodeAtIndex(index: Int) -> Node? {
		if index >= 0 {
			var node = head
			var i = index
			while node != nil {
				if i == 0 { return node }
				i -= 1
				node = node!.next
			}
		}
		return nil
	}
	
	public subscript(index: Int) -> T {
		let node = nodeAtIndex(index)
		assert(node != nil)
		return node!.value
	}
	
	public func append(value: T) {
		let newNode = Node(value: value)
		if let lastNode = last {
			lastNode.next = newNode
		} else {
			head = newNode
		}
	}
	
	private func nodesBeforeAndAfter(index: Int) -> (Node?, Node?) {
		assert(index >= 0)
		
		var i = index
		var next = head
		var prev: Node?
		
		while next != nil && i > 0 {
			i -= 1
			prev = next
			next = next!.next
		}
		assert(i == 0)  // if > 0, then specified index was too large
		
		return (prev, next)
	}
	
	public func insert(value: T, atIndex index: Int) {
		let (prev, next) = nodesBeforeAndAfter(index)
		
		let newNode = Node(value: value)
		newNode.next = next
		prev?.next = newNode
		
		if prev == nil {
			head = newNode
		}
	}
	
	public func removeAll() {
		head = nil
	}
	
	
}

extension LinkedList: CustomStringConvertible {
	public var description: String {
		var s = "["
		var node = head
		while node != nil {
			s += "\(node!.value)"
			node = node!.next
			if node != nil { s += ", " }
		}
		return s + "]"
	}
}

extension LinkedList {
	public func reverse() {
		var node = head
		while let currentNode = node {
			node = currentNode.next
			head = currentNode
		}
	}
}

extension LinkedList {
	public func map<U>(transform: T -> U) -> LinkedList<U> {
		let result = LinkedList<U>()
		var node = head
		while node != nil {
			result.append(transform(node!.value))
			node = node!.next
		}
		return result
	}
	
	public func filter(predicate: T -> Bool) -> LinkedList<T> {
		let result = LinkedList<T>()
		var node = head
		while node != nil {
			if predicate(node!.value) {
				result.append(node!.value)
			}
			node = node!.next
		}
		return result
	}
}