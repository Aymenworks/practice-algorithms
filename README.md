# Practice algorithms
## Goal
- [ ] Have knowledges in data structures
- [ ] Be more efficient when it’s about making data structures choices
- [ ] Understand algorithms complexity to make better algorithms choices

## Why
My goal is to make products that will help people. Building an app that find information quickly could mean the difference between success and failure.
And there are many ways to search and sort data.

Having an understanding of algorithms may help make the right algoorithms that will make an app more robust/performant.

- - - -

## Linear time
O(n)
It means that the search speed will depend on the input size, meaning that the bigger the input is, the less efficient the algoritm will be.
```for number in orderedIntegers {
   if number == numberToFind {
     print("brute force found")
     break
   }
}````

## Logarithmic time
O(Log n)
It means that its complexity is minimized as the input size grow
```var finish = false
            var minIndex = 0
            var maxIndex = orderedIntegers.count-1
            while !finish {
                let midIndex = (minIndex+maxIndex)/2
                let middleValue = orderedIntegers[midIndex]
                
                if middleValue == numberToFind {
                    finish = true
                    print(« binary search found »)
                } else if middleValue < numberToFind {
                    minIndex = midIndex + 1
                } else {
                    maxIndex = midIndex - 1
                }
                
                if minIndex == maxIndex {
                    finish = true
                    print(« not found »)
                }
            }
```

- - - -
![](README/page12image7631664.png) 

## Bubble Sort
Idea: 
	1. We iterate through all the item
	2. For each iteration, we iterate starting the end to the current index
		1. If we current element is bigger than the previous one, we swipe
	3. So little by little we have a sorted list since we regroup the smallest element at the beggining

* With integers, big random data set, it’s O(n^2) for comparaisons and swap
* With integers, big ordered data set, it’s O(n) for comparaisons and swap
* O(1) in term of space
* Less performant than Insertion sort

## Insertion Sort
Idea: 
	1. We iterate through all the item start the second element
	2. For each iteration, while the current element is bigger than the previous element, we swap to the left

* With integers, big random data set, it’s O(n^2) for comparaisons and swap
* With integers, big ordered data set, it’s O(n) for comparaisons and swap
* O(1) in term of space

## Selection Sort
Idea: 
	1. We iterate through all the item
	2. For each iteration, we find the index of the minimum value in a for loop
	3. At the end of the for loop, we swip the current element with the minimmum index
* With integers, big random data set, it’s O(n^2) for comparaisons 
* With integers, big ordered data set, it’s O(n^2) for comparaisons 
* O(n) in term of swap
* O(1) in term of space

#tech #algorithms