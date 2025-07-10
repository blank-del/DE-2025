# Sample Solution for leetcode longest palindrome substring problem
# https://leetcode.com/problems/longest-palindromic-substring/
class Solution:
    def longestPalindrome(self, s: str) -> str:
        longest = ""
        for i in range(len(s)):
            for j in range(i, len(s)):
                substr = s[i:j+1]
                if substr == substr[::-1] and len(substr) > len(longest):
                    longest = substr
                else:
                    continue
        return longest
# Optim solution exists rather than just using brute force O(n^2)
if __name__ == '__main__':
    s = Solution()
    print(s.longestPalindrome("babad"))
    print(s.longestPalindrome("bbbbb"))
    print(s.longestPalindrome("cbbd"))