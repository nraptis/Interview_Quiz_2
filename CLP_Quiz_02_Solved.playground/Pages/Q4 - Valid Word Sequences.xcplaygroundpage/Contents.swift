import Foundation

// You are given a "sentence" and a list of words. Find all unique possible ways to create the sentence from the list of words.

// All characters in the sentence and library will be lower-cased English letters.

// You can only use a word the number of times that it occurs in the list of words.

// You do not need to use all words from the word list, you can have "left overs!"

// Getting the right answer is a lot more important than efficiency for this problem. First "get it" then "get it right" if there's time!

/////////////////////////////////////////////////////
///
///
// Example 1:
// setence = "aaaaa"
// words = ["aaa", "aa", "a", "a"]

//Expected Result:
//["a", "a", "aaa"]
//["a", "aaa", "a"]
//["aa", "aaa"]
//["aaa", "a", "a"]
//["aaa", "aa"]
///
///
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
///
///
// Example 2:
// setence = "catdogcat"
// words = ["cat", "dog", "cat", "dogcat"]

//Expected Result:
//["cat", "dogcat"]
//["cat", "dog", "cat"]
///
///
/////////////////////////////////////////////////////
///
func validWordSequences(sentence: String, words: [String]) -> [[String]] {
    []
}

var test_1_sentence = "harrypotter"
var test_1_words = ["harry", "potter"]
let result_1 = validWordSequences(sentence: test_1_sentence, words: test_1_words)
print("test1, result: \(result_1)")
//Expected Result:
//["harry", "potter"]

var test_2_sentence = "catdogcat"
var test_2_words = ["cat", "dog", "dog", "cat", "cat"]
let result_2 = validWordSequences(sentence: test_2_sentence, words: test_2_words)
print("test2, result: \(result_2)")
//Expected Result:
//["cat", "dog", "cat"]

var test_3_sentence = "catadog"
var test_3_words = ["cat", "ata", "tag", "dog"]
let result_3 = validWordSequences(sentence: test_3_sentence, words: test_3_words)
print("test3, result: \(result_3)")
//Expected Result: []

var test_4_sentence = "aaaaa"
var test_4_words = ["aaa", "aa", "a", "a"]
let result_4 = validWordSequences(sentence: test_4_sentence, words: test_4_words)
print("test4, result: \(result_4)")
//Expected Result:
//["aaa", "a", "a"]
//["a", "aaa", "a"]
//["aa", "aaa"]
//["aaa", "aa"]
//["a", "a", "aaa"]

var test_5_sentence = "catdogcatcatdogcatdogdogcat"
var test_5_words = ["cat", "cat", "cat", "dog", "dog", "dog", "dogcat", "catdog"]
let result_5 = validWordSequences(sentence: test_5_sentence, words: test_5_words)
print("test5, result: \(result_5)")
// Expected Result:
//["catdog", "cat", "cat", "dogcat", "dog", "dog", "cat"]
//["catdog", "cat", "cat", "dog", "cat", "dog", "dogcat"]
//["cat", "dog", "cat", "catdog", "cat", "dog", "dogcat"]
//["cat", "dog", "cat", "cat", "dog", "catdog", "dogcat"]
//["cat", "dogcat", "catdog", "cat", "dog", "dog", "cat"]
//["cat", "dogcat", "cat", "dog", "catdog", "dog", "cat"]

var test_6_sentence = "ababababababa"
var test_6_words = ["a", "a", "a", "a", "a", "a", "a", "b", "b", "b", "b", "b", "b", "b", "b"]
let result_6 = validWordSequences(sentence: test_6_sentence, words: test_6_words)
print("test6, result: \(result_6)")
// Expected Result:
//["a", "b", "a", "b", "a", "b", "a", "b", "a", "b", "a", "b", "a"]

var test_7_sentence = "abababa"
var test_7_words = ["a", "a", "a", "a", "b", "b", "b", "ba"]
let result_7 = validWordSequences(sentence: test_7_sentence, words: test_7_words)
print("test7, result: \(result_7)")
// Expected Result:
//["a", "b", "a", "ba", "b", "a"]
//["a", "ba", "b", "a", "b", "a"]
//["a", "b", "a", "b", "a", "ba"]
//["a", "b", "a", "b", "a", "b", "a"]

var test_8_sentence = "catdogcat"
var test_8_words = ["cat", "dog", "cat", "dogcat"]
let result_8 = validWordSequences(sentence: test_8_sentence, words: test_8_words)
print("test8, result: \(result_8)")
// Expected Result:
//["cat", "dogcat"]
//["cat", "dog", "cat"]
