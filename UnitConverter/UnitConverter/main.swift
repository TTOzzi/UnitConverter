//
//  main.swift
//  UnitConverter
//
//  Created by TTOzzi on 2019/12/20.
//  Copyright © 2019 TTOzzi. All rights reserved.
//
import Foundation

func getUserInput() -> [String] {
    let unit: Set = ["cm", "m", "inch", "yard"]
    while true {
        var input = readLine()!
        if input == "quit" || input == "q" {
            return [""]
        }
        let numberInput = input.filter { "0123456789.".contains($0) }
        for _ in 1...numberInput.count {
            input.removeFirst()
        }
        var unitInput = input.components(separatedBy: " ")
        if Set(unitInput).isSubset(of: unit) {
            unitInput.insert(numberInput, at: 0)
            return unitInput
        }
        print("지원하지 않는 단위입니다.")
    }
}

func convert(value: String, unit: String) -> [String] {
    let number = Double(convertToCentimeter(value: value, unit: unit))!
    var ret = [String]()
    switch unit {
    case "cm":
        ret.append(centimeterToMeter(value: number) + "m")
        ret.append(centimeterToInch(value: number) + "inch")
        ret.append(centimeterToYard(value: number) + "yard")
    case "m":
        ret.append(String(number) + "cm")
        ret.append(centimeterToInch(value: number) + "inch")
        ret.append(centimeterToYard(value: number) + "yard")
    case "inch":
        ret.append(String(number) + "cm")
        ret.append(centimeterToMeter(value: number) + "m")
        ret.append(centimeterToYard(value: number) + "yard")
    case "yard":
        ret.append(String(number) + "cm")
        ret.append(centimeterToMeter(value: number) + "m")
        ret.append(centimeterToInch(value: number) + "inch")
    default:
        return [""]
    }
    return ret
}

func convertToCentimeter(value: String, unit: String) -> String {
    let number = Double(value)!
    switch unit {
    case "cm":
        return String(number)
    case "m":
        return meterToCentimeter(value: number)
    case "inch":
        return inchToCentimeter(value: number)
    case "yard":
        return yardToCentimeter(value: number)
    default:
        return ""
    }

}

//func convertTo(value: [String]) -> String {
//    let number = convertToCentimeter(value: value)
//    let to = value[2]
//    switch to {
//    case "cm":
//        return String(number) + "cm"
//    case "m":
//        return centimeterToMeter(value: Double(number)!) + "m"
//    case "inch":
//        return centimeterToInch(value: Double(number)!) + "inch"
//    case "yard":
//        return centimeterToYard(value: Double(number)!) + "yard"
//    default:
//        return ""
//    }
//}

func centimeterToMeter(value: Double) -> String {
    let ret = value / 100
    return ret.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(ret)) : String(format: "%.3f", ret)
}

func meterToCentimeter(value: Double) -> String {
    let ret = value * 100.0
    return ret.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(ret)) : String(format: "%.3f", ret)
}

func centimeterToInch(value: Double) -> String {
    let ret = value / 2.54
    return ret.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(ret)) : String(format: "%.3f", ret)
}

func inchToCentimeter(value: Double) -> String {
    let ret = value * 2.54
    return ret.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(ret)) : String(format: "%.3f", ret)
}

func centimeterToYard(value: Double) -> String {
    let ret = value / 91.44
    return ret.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(ret)) : String(format: "%.3f", ret)
}

func yardToCentimeter(value: Double) -> String {
    let ret = value * 91.44
    return ret.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(ret)) : String(format: "%.3f", ret)
}


while true {
    let input = getUserInput()
    if input.count == 2 {
        print(convert(value: input[0], unit: input[1]))
//    } else if input.count == 3 {
//        print(convertTo(value: input))
    } else {
        break
    }
}


