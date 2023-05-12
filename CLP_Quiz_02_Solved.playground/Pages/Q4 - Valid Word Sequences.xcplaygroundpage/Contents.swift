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

// Hint: You can convert a string into an array of characters like this:
// let sentenceString = "abc"
// var sentenceArray = Array(sentenceString)

// Does the needle exist in the haystack at this index?
func match(haystack: [Character], index: Int, needle: [Character]) -> Bool {
    if index < 0 { return false }
    if index + needle.count > haystack.count { return false }
    var i = 0
    while i < needle.count {
        if haystack[i + index] != needle[i] { return false }
        i += 1
    }
    return true
}

func validWordSequences(sentence: String, words: [String]) -> [[String]] {
    var result = [[String]]()
    
    var sentence = Array(sentence)
    
    var wordCountDict = [[Character]: Int]()
    var wordArrays = [[Character]]()
    for word in words {
        let word = Array(word)
        wordArrays.append(word)
        wordCountDict[word, default: 0] += 1
    }
    
    var matchDict = [Int: Set<[Character]>]()
    for index in 0..<sentence.count {
        for word in wordCountDict.keys {
            if match(haystack: sentence,
                     index: index,
                     needle: word) {
                matchDict[index, default: Set<[Character]>()].insert(word)
            }
        }
    }
    
    var uniqueResults = Set<[[Character]]>()
    
    var sequence = [[Character]]()
    func helper(index: Int) {
        if index == sentence.count {
            // this is a valid sequence
            uniqueResults.insert(sequence)
            return
        }
        
        // try all words we can match with here
        if let potentialMatches = matchDict[index] {
            for potentialMatch in potentialMatches {
                
                // Have we already used it too many times?
                
                guard let count = wordCountDict[potentialMatch] else { continue }
                guard count > 0 else { continue }
                
                //subtract out the match...
                wordCountDict[potentialMatch] = count - 1
                // add to temp...
                sequence.append(potentialMatch)
                
                // recurse...
                helper(index: index + potentialMatch.count)
                
                //add the match back...
                wordCountDict[potentialMatch] = count
                // remove from temp
                sequence.removeLast()
            }
        }
    }
    
    helper(index: 0)
    
    for _result in uniqueResults {
        result.append(_result.map { String($0) })
    }
    
    return result
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
