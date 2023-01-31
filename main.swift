/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Codec {
    func serialize(_ root: Node?) -> String {
    	guard let root = root else { return "" }

        var result = ""

        func dfs(_ root: Node) {
            result += "\(root.val),\(root.children.count),"
            for child in root.children {
                dfs(child)
            }
        }

        dfs(root)

        return result
    }
    
    func deserialize(_ data: String) -> Node? {
        guard !data.isEmpty else { return nil }

    	var data = data
            .split(separator: ",")
            .map({Int($0)!})
            .makeIterator()

        func dfs(_ value: Int) -> Node {
            let root = Node(value)
            for _ in 0..<data.next()! {
                root.children.append(dfs(data.next()!))
            }
            return root
        }
    
        return dfs(data.next()!)
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * let ret_1: TreeNode? = obj.serialize(root)
 * let ret_2: Node? = obj.decode(data)
 */