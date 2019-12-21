//
//  main.swift
//  UnitConverter
//
//  Created by TTOzzi on 2019/12/20.
//  Copyright © 2019 TTOzzi. All rights reserved.
//
import Foundation

let input = readLine()!

func convert(value: String) {
    var tmp = value
    let number = tmp.components(separatedBy: CharacterSet.letters).joined()
    for _ in 1...number.count {
        tmp.removeFirst()
    }
    switch tmp {
    case "cm":
        print("\(centimeterToMeter(value: Double(number)!))m")
    case "m":
        print("\(meterToCentimeter(value: Double(number)!))cm")
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

convert(value: input)

