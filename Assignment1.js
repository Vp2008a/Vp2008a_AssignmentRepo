// 1. Check if two strings are anagrams
function isAnagram(str1, str2) {
    const normalize = str => str.toLowerCase().replace(/[^a-z0-9]/g, '');
    const sorted = str => normalize(str).split('').sort().join('');
    return sorted(str1) === sorted(str2);
}

// Sample Inputs and Outputs for isAnagram
console.log("1. isAnagram:");
console.log(isAnagram("listen", "silent")); // true
console.log(isAnagram("hello", "world"));   // false
console.log(""); // Gap

// 2. Calculate total spent by category
function calculateTotalSpentByCategory(transactions) {
    return transactions.reduce((acc, { category, price }) => {
        acc[category] = (acc[category] || 0) + price;
        return acc;
    }, {});
}

// Sample Inputs and Outputs for calculateTotalSpentByCategory
console.log("2. calculateTotalSpentByCategory:");
const transactions = [
    { category: 'Food', price: 20 },
    { category: 'Food', price: 15 },
    { category: 'Transport', price: 50 }
];
console.log(calculateTotalSpentByCategory(transactions)); // { Food: 35, Transport: 50 }
console.log(""); // Gap

// 3. Find the largest element in an array
function findLargestElement(numbers) {
    return Math.max(...numbers);
}

// Sample Inputs and Outputs for findLargestElement
console.log("3. findLargestElement:");
console.log(findLargestElement([3, 5, 7, 2, 8])); // 8
console.log(""); // Gap

// 4. Check if a string is a palindrome
function isPalindrome(str) {
    const cleanStr = str.replace(/[\W_]/g, '').toLowerCase();
    return cleanStr === cleanStr.split('').reverse().join('');
}

// Sample Inputs and Outputs for isPalindrome
console.log("4. isPalindrome:");
console.log(isPalindrome("A man a plan a canal Panama")); // true
console.log(isPalindrome("Hello")); // false
console.log(""); // Gap

// 5. Calculate time to sum from 1 to n
function calculateTime(n) {
    const start = performance.now();
    let sum = 0;
    for (let i = 1; i <= n; i++) sum += i;
    const end = performance.now();
    return (end - start) / 1000;
}

// Sample Inputs and Outputs for calculateTime
console.log("5. calculateTime:");
console.log(calculateTime(1000)); // e.g., 0.001 (varies)
console.log(""); // Gap

// 6. Count vowels in a string
function countVowels(str) {
    return (str.match(/[aeiouAEIOU]/g) || []).length;
}

// Sample Inputs and Outputs for countVowels
console.log("6. countVowels:");
console.log(countVowels("Hello World")); // 3
console.log(countVowels("This is a test")); // 4
console.log(""); // Gap

// 7. Sum all numbers in an array
function sumArray(numbers) {
    return numbers.reduce((sum, num) => sum + num, 0);
}

// Sample Inputs and Outputs for sumArray
console.log("7. sumArray:");
console.log(sumArray([1, 2, 3, 4, 5])); // 15
console.log(sumArray([10, 20, 30]));   // 60
console.log(""); // Gap

// 8. Filter even numbers from an array
function filterEvenNumbers(numbers) {
    return numbers.filter(num => num % 2 === 0);
}

// Sample Inputs and Outputs for filterEvenNumbers
console.log("8. filterEvenNumbers:");
console.log(filterEvenNumbers([1, 2, 3, 4, 5])); // [2, 4]
console.log(filterEvenNumbers([6, 7, 8, 9]));   // [6, 8]
console.log(""); // Gap

// 9. Find the smallest element in an array
function findSmallestElement(numbers) {
    return Math.min(...numbers);
}

// Sample Inputs and Outputs for findSmallestElement
console.log("9. findSmallestElement:");
console.log(findSmallestElement([3, 5, 7, 2, 8])); // 2
console.log(""); // Gap

// 10. Reverse a string
function reverseString(str) {
    return str.split('').reverse().join('');
}

// Sample Inputs and Outputs for reverseString
console.log("10. reverseString:");
console.log(reverseString("Hello")); // "olleH"
console.log(reverseString("JavaScript")); // "tpircSavaJ"
console.log(""); // Gap

// 11. Find the nth Fibonacci number
function fibonacci(n) {
    if (n <= 1) return n;
    let [a, b] = [0, 1];
    for (let i = 2; i <= n; i++) {
        [a, b] = [b, a + b];
    }
    return b;
}

// Sample Inputs and Outputs for fibonacci
console.log("11. fibonacci:");
console.log(fibonacci(5)); // 5
console.log(fibonacci(10)); // 55
console.log(""); // Gap

// 12. Remove duplicates from an array
function removeDuplicates(arr) {
    return [...new Set(arr)];
}

// Sample Inputs and Outputs for removeDuplicates
console.log("12. removeDuplicates:");
console.log(removeDuplicates([1, 2, 2, 3, 4, 4, 5])); // [1, 2, 3, 4, 5]
console.log(""); // Gap

// 13. Count occurrences of a character in a string
function countOccurrences(str, char) {
    return (str.match(new RegExp(char, 'g')) || []).length;
}

// Sample Inputs and Outputs for countOccurrences
console.log("13. countOccurrences:");
console.log(countOccurrences("banana", 'a')); // 3
console.log(countOccurrences("Mississippi", 's')); // 4
console.log(""); // Gap

// 14. Find common elements between two arrays
function findCommonElements(arr1, arr2) {
    return arr1.filter(element => arr2.includes(element));
}

// Sample Inputs and Outputs for findCommonElements
console.log("14. findCommonElements:");
console.log(findCommonElements([1, 2, 3, 4], [3, 4, 5, 6])); // [3, 4]
console.log(""); // Gap

// 15. Sort an array of strings alphabetically
function sortStrings(arr) {
    return arr.slice().sort();
}

// Sample Inputs and Outputs for sortStrings
console.log("15. sortStrings:");
console.log(sortStrings(["banana", "apple", "cherry"])); // ["apple", "banana", "cherry"]
console.log(sortStrings(["zebra", "monkey", "apple"])); // ["apple", "monkey", "zebra"]
console.log(""); // Gap
