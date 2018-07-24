//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//: 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
//: ### 思路1：
//: 对数组中的数据进行排序，然后再进行操作。

var numbers = [1,2,2,4,5,45,1,5,7,45,8,7,15,8,4,9,3,3,9]


func singleNumber(_ nums: [Int]) -> Int {
    
    // 先对数组进行排序
    var numbers = nums
    for  i in 1..<numbers.count {
        var k = i - 1;
        let   K = numbers[i]
        while k > 0 && numbers[k] > K {
            numbers[k + 1] = numbers[k]
            k = k - 1
        }
        numbers[ k + 1] = K
    }
    
    var k = 0
    for _ in numbers {
        if numbers[k] - numbers[k + 1]  == 0 {
            k = k + 2
        }else {
            return numbers[k]
        }
    }
    return 0
}

let re = singleNumber(numbers)

//:思路 2
//:通过异或操作，对数组中所有元素进行异或操作

func singleNumber2(_ nums: [Int]) -> Int {
    var re = 0
    for number in nums {
        re = re^number
    }
    return re
}

var result = singleNumber2(numbers)
