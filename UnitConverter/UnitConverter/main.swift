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

func convert(value: [String]) {
    var tmp = value[0]
    let number = tmp.components(separatedBy: CharacterSet.letters).joined()
    for _ in 1...number.count {
        tmp.removeFirst()
    }
    switch tmp {
    case "cm":
        if value.count == 2, value[1] == "inch" {
            print("\(centimeterToInch(value: Double(number)!))inch")
        } else {
            print("\(centimeterToMeter(value: Double(number)!))m")
        }
    case "m":
        if value.count == 2, value[1] == "inch" {
            print("\(centimeterToInch(value: Double(meterToCentimeter(value: Double(number)!))!))inch")
        } else {
            print("\(meterToCentimeter(value: Double(number)!))cm")
        }
    case "inch":
        if value.count == 2, value[1] == "m" {
            print("\(centimeterToMeter(value: Double(inchToCentimeter(value: Double(number)!))!))")
        } else {
            print("\(inchToCentimeter(value: Double(number)!))")
        }
    default:
        break
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

