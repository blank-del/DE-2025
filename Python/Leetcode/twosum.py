# Sample Solution for leetcode two sum problem 
# https://leetcode.com/problems/two-sum/description/
from typing import List
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        '''
            Naive approach where we compare each ith element with all the i+1 elements
        '''
        for i, num in enumerate(nums):
            try:
                index = nums.index(target-num, i+1)
                return [i, index]
            except:
                continue
        return []
    
    def twoSum_optim(self, nums: List[int], target: int) -> List[int]:
        #nums_dict = dict(zip(nums, range(len(nums))))
        nums_dict = {}
        ''''
        Test Cases
        [2, 7, 11, 15] 9
        [3, 2, 4] 6
        [3, 3] 6
        '''
        for index, value in enumerate(nums):
            if value not in nums_dict:
                nums_dict[value] = index
            dict_index = nums_dict.get(target-value, -1)
            if dict_index != -1 and dict_index != index:
                return [index, dict_index]
        return []
            

    
if __name__ == '__main__':
    s = Solution()
    print(s.twoSum([2, 7, 11, 15], 9))
    print(s.twoSum([2, 7, 11, 15], 15))

    print(s.twoSum_optim([2, 7, 11, 15], 9))
    print(s.twoSum_optim([2, 7, 11, 15], 15))