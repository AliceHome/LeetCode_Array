//: [Previous](@previous)
//# 两个数字之和

let numbers = [3,2,4]
let target = 6

//:# 暴力法
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    for i in 0 ..< nums.count {
        for j in  i + 1 ..< nums.count {
            if nums[i] + nums[j] == target {
                return [i,j]
            }
        }
    }
    
    return []
}


let result = twoSum(numbers, target)


//:# 两遍 Hash

func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    var map : [Int : Int] = [Int : Int]()
    
    for i in 0 ..< nums.count {
        map[nums[i]] = i
    }

    for  i in 0 ..< nums.count {
        var result = target - nums[i]
        if let temp = map[result] {
            if i != temp {
                return [i, temp]
            }
        }
    }
    return []
}

twoSum1(numbers,target)


//:# 一遍 Hash
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var map : [Int : Int] = [Int : Int]()
    
    for  i in 0 ..< nums.count {
        var result = target - nums[i]
        if let temp = map[result] {
                return [i, temp]
        }
        
        map[nums[i]] = i
    }
    return []
}

twoSum2(numbers,target)
//: [Next](@next)
