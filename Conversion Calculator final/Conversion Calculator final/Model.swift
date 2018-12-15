//
//  Model.swift
//  Conversion Calculator final
//
//  Created by Melissa Hollingshed on 12/15/18.
//  Copyright © 2018 Melissa Hollingshed. All rights reserved.
//

import Foundation
class Model {
    
    var currentIn: String = ""
    var currentOut: String = ""
    var currentConverter = 0
    var decimalFlag = false
    
    struct Converter {
        var label: String?
        var inputUnit: String?
        var outputUnit: String?
    }
    
    let c1 = Converter(label: "Fahrenheit to Celcius",
                       inputUnit: "°F",
                       outputUnit: "°C")
    let c2 = Converter(label: "Celcius to Fahrenheit",
                       inputUnit: "°C",
                       outputUnit: "°F")
    let c3 = Converter(label: "Miles to Kilometers",
                       inputUnit: "mi",
                       outputUnit: "km")
    let c4 = Converter(label: "Kilometers to Miles",
                       inputUnit: "km",
                       outputUnit: "mi")
    
    lazy var converterArray = [c1,c2,c3,c4]
}
