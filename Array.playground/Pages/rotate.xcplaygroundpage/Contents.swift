//: [Previous](@previous)

import Foundation

//:# 旋转数组
//: 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
//: 说明:
//: - 尽可能相处更多的解决方案，至少有三种不同的方法可以解决这个问题；
//: - 要求使用空间复杂度为 O（1） 的原地算法

//: 思路一
//:如果不考虑空间复杂度这快，最简单的方式是直接创建一个新的 copy ，然后通过数组下标的 % 运算进行替换
var numbers = [1,2,3,4,5,6,7]
var  k = 3
var numberCopy = numbers
for i in 0 ..< numbers.count {
    numberCopy[(k + i) % numbers.count] = numbers[i]
}

numberCopy


//:思路二：
//:按照交换的顺序，一个一个的进行交换，空间复杂度达到要求，但是时间复杂度太大了
/*:
 ```
 k = 1 ，进行交换
 
   1,2,3,4,5,6,7
 0 7,2,3,4,5,6,1 6 0
 1 7,2,3,4,5,1,6 6 5
 2 7,2,3,4,1,5,6 5 4
 3 7,2,3,1,4,5,6 4 3
 4 7,2,1,3,4,5,6 3 2
 5 7,1,2,3,4,5,6 2 1

6,1,2,3,4,5,7
```
 */

var a = 10
var b = 20
a = a ^ b
b = b ^ a
a = a ^ b

var  count = numbers.count
var start = 0
k = k % count
for _ in 0 ..< k {
    
    for i in 0 ..< count - 1 {
        numbers[count - i - 1] = numbers[count - i-1] ^ numbers[(count - i) % count]
        numbers[(count - i) % count] =  numbers[(count - i) % count] ^ numbers[count - i-1]
        numbers[count - i - 1] = numbers[count - i-1] ^ numbers[(count - i) % count]
       
    }
 
}


//: 思路三
//numbers = [1,2]
//
//var count1 = numbers.count
//k = 1
//k = k % numbers.count
//
func swapNumbers<T>(_ nums: inout Array<T>, _ p: Int, _ q: Int) {
    (nums[p], nums[q]) = (nums[q], nums[p])
}
//
//for i in 0 ..< numbers.count - k + 1 {
//     print(i)
//    print(numbers.count - (k - i % k))
//    swapNumbers(&numbers, i, numbers.count - (k - (i % k)) )
//    print(numbers)
//}
//
//numbers


func rotate(_ nums: inout [Int], _ k: Int) {
        var count = nums.count
        var start = 0
        var vk = k
        vk = vk % count
        while count > 0 && vk > 0{
            for i in 0 ..< vk {
                // i + start count - vk + i + start
//               swapNumbers(&nums, i + start, count-vk+i + start)
                nums.swapAt(i + start, count-vk+i + start)
            }
            count = count - vk
            start = start + vk
            vk = vk % count
        }
}

numbers = [1,2,3,4,5,6,7]
rotate(&numbers, 3  )
numbers

//: 思路三 优化
//使用 swapAt 代替自己实现的数组元素交换函数
//: [Next](@next)
