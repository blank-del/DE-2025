# Sample Solution for leetcode median of sorted arrays problem 
# https://leetcode.com/problems/median-of-two-sorted-arrays/
from typing import List
from math import ceil

class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        res_list = []
        i = 0
        j = 0

        while i < len(nums1) and j < len(nums2):
            if nums1[i] < nums2[j]:
                res_list.append(nums1[i])
                i+=1
            else:
                res_list.append(nums2[j])
                j+=1
        if len(nums1)>0 and len(nums2)>0 and (nums1[i-1] < nums2[j-1]):
            res_list.extend(nums1[i:])
            res_list.extend(nums2[j:])
        else:
            res_list.extend(nums2[j:])
            res_list.extend(nums1[i:])
        # even
        if len(res_list)%2 == 0:
            return (res_list[int(len(res_list)/2)-1] + res_list[int(len(res_list)/2)])/2
        # odd
        else:
            return res_list[ceil(len(res_list)/2)-1]

if __name__ == '__main__':
    s = Solution()
    #print(s.findMedianSortedArrays([1, 3], [2]))
    #print(s.findMedianSortedArrays([1, 2], [3, 4]))
    list1 = []
    list2 = [1]
    print(list1[0])