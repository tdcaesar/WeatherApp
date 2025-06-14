//
//  Day.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/6/25.
//


import SwiftUI

enum Day : String {
    case MON = "MON"
    case TUE = "TUE"
    case WED = "WED"
    case THR = "THR"
    case FRI = "FRI"
    case SAT = "SAT"
    case SUN = "SUN"
}

func IsWeekend(day: Day) -> Bool {
    return day == .SAT || day == .SUN
}
