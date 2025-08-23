def count_words(sentence):
    words = sentence.strip().split()
    return len(words)

def count_vowels(sentence):
    count = 0
    vowels = 'AEIOUaeiou'
    for i in sentence:
        if i in vowels:
            count += 1
    return count

def case_count(sentence):
    data = {
        "Uppercase": 0,
        "Lowercase": 0
    }
    for i in sentence:
        if i.isupper():
            data["Uppercase"] += 1
        else:
            data["Lowercase"] += 1
    return data

def find_longest(sentence):
    s = sentence.strip().split()
    longest = s[0]
    for i in range(1, len(s)):
        if len(s[i]) > len(longest):
            longest = s[i]
    return longest


try:
    user_input = input("Enter a sentence : ")
except Exception:
    raise ValueError

word_count = count_words(user_input)
print("Words in the sentence: ",word_count)

vowel_count = count_vowels(user_input)
print("Vowels in the sentence", vowel_count)

case = case_count(user_input)
print("Case count data: ", case)

print("Longest word in the sentence is : ", find_longest(user_input))

# reverse of the string
s = user_input.strip().split()
print(' '.join(s[::-1]))


