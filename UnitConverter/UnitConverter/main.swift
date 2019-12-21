//
//  main.swift
//  UnitConverter
//
//  Created by TTOzzi on 2019/12/20.
//  Copyright © 2019 TTOzzi. All rights reserved.
//
import Foundation

let cm = "120cm"
var m = "1.86m"

func separate(value: String) -> [String] {
    var tmp = value
    var ret = [String]()
    ret.append(tmp.components(separatedBy: CharacterSet.letters).joined())
    for _ in 1...ret[0].count {
        tmp.removeFirst()
    }
    ret.append(tmp)
    return ret
}

func convert(value: [String]) -> String {
    var number = Double(value[0])!
    var unit = value[1]
    switch unit {
    case "cm":
        number = number / 100
        unit = "m"
    case "m":
        number = number * 100
        unit = "cm"
    default:
        break
    }
    return number.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(number)) + unit : String(number) + unit
}
    
print(convert(value: separate(value: cm)))
print(convert(value: separate(value: m)))
