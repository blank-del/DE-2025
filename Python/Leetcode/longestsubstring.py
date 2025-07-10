# Sample Solution for leetcode longest substring problem 
# https://leetcode.com/problems/longest-substring-without-repeating-characters/
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        max_dic = {}
        max_len = 0
        for i in range(len(s)):
            len_counter = 0
            temp_dic = {}
            for j in range(i, len(s)):
                if s[j] not in temp_dic:
                    temp_dic[s[j]] = j
                    len_counter +=1
                else:
                    break
            if len_counter>max_len:
                max_len = len_counter
                max_dic = dict(temp_dic)
        print(max_dic)
        return max_len

if __name__ == '__main__':
    s = Solution()
    print(s.lengthOfLongestSubstring("abcabcbb"))
    print(s.lengthOfLongestSubstring("bbbbb"))
    print(s.lengthOfLongestSubstring("pwwkew"))