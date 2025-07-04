# Sample Solution for leetcode add two numbers problem
# https://leetcode.com/problems/add-two-numbers/

from typing import Optional

# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
    def __str__(self) -> str:
        result = ""
        current = self
        while current != None:
            result+= str(current.val)
            current = current.next
        return result

class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        s1 = ""
        current = l1
        while current != None:
            s1 += str(current.val)
            current = current.next
        num1 = int(s1[::-1])

        s2 = ""
        current = l2
        while current != None:
            s2 += str(current.val)
            current = current.next
        num2 = int(s2[::-1])

        result = num1 + num2
        result = str(result)[::-1]

        res_node = ListNode()
        current = res_node
        for i in range(len(result)):
            current.val = int(result[i])
            if i <= len(result)-2:
                current.next = ListNode()
                current = current.next
        return res_node
    
if __name__ == "__main__":
    s = Solution()
    l1 = ListNode(val = 2, next=(ListNode(val = 4, next=ListNode(val=3))))
    l2 = ListNode(val = 5, next=(ListNode(val = 6, next=ListNode(val=4))))

    print(s.addTwoNumbers(l1, l2))