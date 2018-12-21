//
//  LinkedList.swift
//  
//
//  Created by goeun on 21/12/2018.
//

import Foundation

// 양방향 링크드리스트
class Node {
    var value: String
    var next: Node?
    var previos: Node?
    
    init(value: String) {
        self.value = value
    }
}

class LinkedList {
    var head: Node?
    var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    // 리스트 마지막에 노드 추가
    func append(node: Node) {
        let newNode = node
        
        // 노드가 하나도 없을때
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            if let tailNode = tail {
                tailNode.next = newNode
                newNode.previos = tailNode
                tail = newNode
            }
        }
    }
    
    // 리스트 전체 노드 삭제
    func removeAll() {
        head = nil
        tail = nil
    }
    
    // 특정 노드 삭제
    func remove(node: Node) {
        let previosNode = node.previos
        let nextNode = node.next
        
        // 첫번째 노드일때
        if previosNode == nil {
            head = nextNode
            nextNode?.previos = nil
        }
            // 마지막 노드일때
        else if nextNode == nil {
            tail = previosNode
            previosNode?.next = nil
        }
            // 중간 노드일때
        else {
            previosNode?.next = nextNode
            nextNode?.previos = previosNode
        }
    }
    
    // 리스트 출력
    func print() {
        if isEmpty {
            print("Empty List")
        } else {
            var current = head
            while current != nil {
                if let currentNode = current {
                    print(currentNode.value)
                    current = currentNode.next
                }
            }
        }
    }
}
