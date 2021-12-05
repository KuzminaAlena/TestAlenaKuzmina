// MARK: - Solutions

//First way
func rotateFirstWay(_ nums: inout [Int], _ k: Int) {
    let index = k % nums.count
    if index != 0 {
        for _ in 1...(index) {
            let lastValue = nums[nums.count - 1]
            for i in (1..<nums.count).reversed() {
                nums[i] = nums[i - 1]
            }
            nums[0] = lastValue
        }
    }
}
//Second way
func rotateSecondWay(_ nums: inout [Int], _ k: Int) {
    var i = 1
    let index = (k % nums.count)
    while i <= index {
        nums.insert(nums.remove(at: nums.count - 1), at: 0)
        i += 1
    }
}

//Third way
func rotateThirdWay(_ nums: inout [Int], _ k: Int) {
    let index = k % nums.count
    for _ in 1...(nums.count - index) {
        nums.append(nums[0])
        nums.remove(at: 0)
    }
}

//Fourth way
// Confirms O(1)
func rotateFourthWay(_ nums: inout [Int], _ k: Int) {
    let index = k % nums.count
    nums = nums.dropFirst(nums.count - index) + nums.dropLast(index)
}

//Fifth way index = 0 crash
// Confirms O(1)
func rotateFifthWay(_ nums: inout [Int], _ k: Int) {
    let index = k % nums.count
    if index != 0 {
        let firstPart = nums[(nums.count - index)...(nums.count - 1)]
        let lastPart = nums[..<(nums.count - index)]
        nums = Array(firstPart) + Array(lastPart)
    }
}

//Sixth way
// Confirms O(1)
func rotateSixthWay(_ nums: inout [Int], _ k: Int){
    let index = nums.count - (k % nums.count)
    let result = nums[index...] + nums[..<index]
    nums = Array(result)
}

enum Variant: CaseIterable {
    case first
    case second
    case third
    case fourth // Confirms O(1)
    case fifth //Confirms O(1)
    case sixth //Confirms O(1)
}

enum ValidationError: CaseIterable {
    case invalidNumsLength
    case invalidNums
    case invalidK
    
    var message: String {
        switch self {
        case .invalidNumsLength:
            return "Wrong array length"
        case .invalidNums:
            return "Wrong array value"
        case .invalidK:
            return "Wrong parameter k"
        }
    }
}

// MARK: - Main function "rotate"

func rotate(variant: Variant, _ nums: inout [Int], _ k: Int) -> [ValidationError]? {
    let isNumsLengthValid = (1 <= nums.count && nums.count <= 105)
    let isNumsValid = nums.contains(where: { (-231 <= $0 && $0 <= 231 - 1) == true })
    let isKValid = (1 <= k && k <= 105)
    var validVariant:[ValidationError]?
    
    guard isNumsLengthValid, isNumsValid, isKValid else {
        if !isNumsLengthValid, !isNumsValid, !isKValid {
            validVariant = ValidationError.allCases
            return validVariant
        } else if !isNumsLengthValid, !isNumsValid {
            validVariant = [.invalidNumsLength, .invalidNums]
            return validVariant
        } else if !isNumsLengthValid, !isKValid {
            validVariant =  [.invalidNumsLength, .invalidK]
            return validVariant
        } else if !isNumsValid, !isKValid {
            validVariant =  [.invalidNums, .invalidK]
            return validVariant
        } else if !isNumsValid {
            validVariant =  [.invalidNums]
            return validVariant
        } else if !isNumsLengthValid {
            validVariant =  [.invalidNumsLength]
            return validVariant
        } else if !isKValid {
            validVariant =  [.invalidK]
            return validVariant
        } else {
            validVariant =  nil
            return validVariant
        }
    }
    
    switch variant {
    case .first:
        rotateFirstWay(&nums, k)
    case .second:
        rotateSecondWay(&nums, k)
    case .third:
        rotateThirdWay(&nums, k)
    case .fourth:
        rotateFourthWay(&nums, k)
    case .fifth:
        rotateFifthWay(&nums, k)
    case .sixth:
        rotateSixthWay(&nums, k)
    }
    
    
    return validVariant
}

// MARK: - Test

func test() {
    let kVariants: [Int] = [106, 105, 104, 0, 1, -1, -10, -251, 125, 60, 4, 6, 3]
    let numsVariants: [[Int]] = [
        Array(1...105),
        Array(1...106),
        Array(0...105),
        Array(0...104),
        Array(0...106),
        Array(1...105),
        Array((-231)...(-145)),
        Array((-232)...(-145)),
        Array((-230)...(-145)),
        Array((153)...(231)),
        Array((153)...(232)),
        Array((153)...(230)),
        Array(-231...231),
        Array(50...150),
        Array(-50...50)
    ]
    kVariants.forEach { k in
        numsVariants.forEach { nums in
            Variant.allCases.forEach {
                var mutableNums = nums
                let errors = rotate(variant: $0, &mutableNums, k)
                print("\n====================")
                print("Variant: \($0)\nnums: \(nums)\nk: \(k)")
                if let errors = errors {
                    print("Error!")
                    errors.forEach {
                        print($0.message)
                    }
                } else {
                    print("Success!")
                    print("result: \(mutableNums)")
                }
                print("====================\n")
            }
        }
    }
}

test()

