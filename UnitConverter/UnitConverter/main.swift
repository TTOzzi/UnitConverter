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
    var ret = [String]()
    while true {
        var input = readLine()!
        if input == "quit" || input == "q" {
            return [""]
        }
        let numberInput = input.filter { "0123456789.".contains($0) }
        for _ in 1...numberInput.count {
            input.removeFirst()
        }
        let unitInput = input.components(separatedBy: " ")
        if unitInput.count == 2 {
            ret = [unitInput[0]] + unitInput[1].components(separatedBy: ",")
        } else {
            ret = [unitInput[0]]
        }
        if Set(ret).isSubset(of: unit) {
            ret.insert(numberInput, at: 0)
            return ret
        }
        print("지원하지 않는 단위입니다.")
    }
}

func convertToCentimeter(value: String, unit: String) -> String {
    let number = Double(value)!
    switch unit {
    case "cm":
        return formatNumber(number)
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

func convertTo(value: String, unit: String, to: String) -> String {
    let number = Double(convertToCentimeter(value: value, unit: unit))!
    switch to {
    case "cm":
        return formatNumber(number) + "cm"
    case "m":
        return centimeterToMeter(value: number) + "m"
    case "inch":
        return centimeterToInch(value: number) + "inch"
    case "yard":
        return centimeterToYard(value: number) + "yard"
    default:
        return ""
    }
}

func centimeterToMeter(value: Double) -> String {
    let ret = value / 100
    return formatNumber(ret)
}

func meterToCentimeter(value: Double) -> String {
    let ret = value * 100.0
    return formatNumber(ret)
}

func centimeterToInch(value: Double) -> String {
    let ret = value / 2.54
    return formatNumber(ret)
}

func inchToCentimeter(value: Double) -> String {
    let ret = value * 2.54
    return formatNumber(ret)
}

func centimeterToYard(value: Double) -> String {
    let ret = value / 91.44
    return formatNumber(ret)
}

func yardToCentimeter(value: Double) -> String {
    let ret = value * 91.44
    return formatNumber(ret)
}

func formatNumber(_ number: Double) -> String {
    return number.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(number)) : String(format: "%.3f", number)
}

while true {
    var input = getUserInput()
    let value = input.removeFirst()
    if value == "" {
        break
    }
    let unit = input.removeFirst()
    if input.count == 0 {
        let units = ["cm", "m", "inch", "yard"]
        units.forEach { if $0 != unit { print(convertTo(value: value, unit: unit, to: $0)) } }
    } else {
        input.forEach { print(convertTo(value: value, unit: unit, to: $0)) }
    }
}


