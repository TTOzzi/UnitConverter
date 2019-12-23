//
//  main.swift
//  UnitConverter
//
//  Created by TTOzzi on 2019/12/20.
//  Copyright © 2019 TTOzzi. All rights reserved.
//
import Foundation

func getUserInput() -> [String] {
    let unit: Set = ["cm", "m", "inch"]
    while true {
        var input = readLine()!
        let numberInput = input.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
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

func convert(value: [String]) -> [String] {
    let number = Double(value[0])!
    let unit = value[1]
    switch unit {
    case "cm":
        return [centimeterToMeter(value: number), "m"]
    case "m":
        return [meterToCentimeter(value: number), "cm"]
    case "inch":
        return [inchToCentimeter(value: number), "cm"]
    default:
        return [""]
    }
}

func convertTo(value: [String]) -> [String] {
    var tmp = value
    let to = tmp.removeLast()
    switch to {
    case "cm":
        return convert(value: tmp)
    case "m":
        if tmp[1] == "cm" {
            return convert(value: tmp)
        } else {
            return convert(value: convert(value: tmp))
        }
    case "inch":
        if tmp[1] == "cm" {
            return [centimeterToInch(value: Double(tmp[0])!), "inch"]
        } else {
            return [centimeterToInch(value: Double(convert(value: tmp)[0])!), "inch"]
        }
    default:
        return [""]
    }
}

func centimeterToMeter(value: Double) -> String {
    let ret = value / 100
    return ret.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(ret)) : String(ret)
}

func meterToCentimeter(value: Double) -> String {
    let ret = value * 100.0
    return ret.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(ret)) : String(ret)
}

func centimeterToInch(value: Double) -> String {
    let ret = value / 2.54
    return ret.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(ret)) : String(ret)
}

func inchToCentimeter(value: Double) -> String {
    let ret = value * 2.54
    return ret.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(ret)) : String(ret)
}

let input = getUserInput()
var result = [String]()
if input.count == 2 {
    result = convert(value: input)
} else {
    result = convertTo(value: input)
}
print(result[0] + result[1])
