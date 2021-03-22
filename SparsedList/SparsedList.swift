//
//  SparsedList.swift
//  SparsedList
//
//  Created by Oleksiy on 22.03.2021.
//

import Foundation

class SparsedList<T: Comparable> {
    
    private var rootNode: Node<T>?
    
    func get(x: Int, y: Int, z: Int) -> T? {
        var node = rootNode
        
        while let currentNode = node {
            if currentNode.x == x && currentNode.y == y && currentNode.z == z {
                return currentNode.value
            }
            node = currentNode.nextNode
        }

        return nil
    }
    
    func set(x: Int, y: Int, z: Int, value: T){
        let newNode = Node(x: x, y: y, z: z, value: value)
        
        guard let root = rootNode else {
            rootNode = newNode
            return
        }
        
        if newNode.isCoordinatesSmaller(than: root) {
            newNode.nextNode = root
            rootNode = newNode
            
            return
        }
        
        var node = root
        while !newNode.isCoordinatesSmaller(than: node.nextNode ?? Node(x: Int.max, y: Int.max, z: Int.max, value: root.value)) {
            guard let nextNode = node.nextNode else {
                break
            }
            node = nextNode
        }
        
        if newNode.x == node.x && newNode.y == node.y && newNode.z == node.z {
            node.value = value
            return
        }
        
        newNode.nextNode = node.nextNode
        node.nextNode = newNode
    }
    
    func sortNonEmpty() {
        
    }
    
    func toString() -> String {
        var node = rootNode
        var res = ""
        
        while let nodeToPrint = node {
            res += "\(nodeToPrint.toString())\n"
            node = nodeToPrint.nextNode
        }
        
        return res
    }
    
}
