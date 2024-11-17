//
//  CalculationViewVM.swift
//  RightTriangleCalculator
//
//  Created by Dinith Fernando on 2024-11-15.
//

import Foundation
import SwiftUI

class CalculationViewVM: ObservableObject {
    
    @Published var base:String = ""
    @Published var altitude:String = ""
    @Published var hypotenus:String = ""

    @Published var unknownSide:UnknownSide = .base

    @Published var calculatedArea:Double = 0.0
    @Published var calculatedPerimeter:Double = 0.0
    @Published var unknownSideValue:Double = 0.0
    
    @AppStorage("Altitude") var altitudeValue:String = ""
    @AppStorage("Base") var baseValue:String = ""
    @AppStorage("Hypotenus") var hypotenusValue:String = ""
    @AppStorage("Area") var areaValue:String = ""
    @AppStorage("Perimeter") var perimeterValue:String = ""
    
    private func calculateArea() {
        calculatedArea = (Double(base) ?? 0.0) * (Double(altitude) ?? 0.0) / 2
    }
    
    private func calculatePerimeter(){
        calculatedPerimeter = (Double(base) ?? 0.0) + (Double(altitude) ?? 0.0) + sqrt(pow((Double(base) ?? 0.0), 2) + pow((Double(altitude) ?? 0.0), 2))
    }
    
    private func getUnknownSideValue(){
        switch(unknownSide){
        case .hypotenus:
            unknownSideValue = sqrt(pow((Double(base) ?? 0.0), 2) + pow((Double(altitude) ?? 0.0), 2))
            hypotenus = String(unknownSideValue)
        case .base:
            unknownSideValue = sqrt(pow((Double(hypotenus) ?? 0.0), 2) - pow((Double(altitude) ?? 0.0), 2))
            base = String(unknownSideValue)
        case .altitude:
            unknownSideValue = sqrt(pow((Double(hypotenus) ?? 0.0), 2) - pow((Double(base) ?? 0.0), 2))
            altitude = String(unknownSideValue)
        }
    }
    
    func calculate(){
        calculateArea()
        calculatePerimeter()
        getUnknownSideValue()
        
        if(calculatedArea != 0 || calculatedPerimeter != 0 || unknownSideValue != 0){
            altitudeValue = altitude
            baseValue = base
            hypotenusValue = hypotenus
            areaValue = String(format: "%.2f", calculatedArea)
            perimeterValue = String(format: "%.2f", calculatedPerimeter)
        }
    }
    
    func reset(){
        hypotenus = ""
        base = ""
        altitude = ""
        calculatedArea = 0
        calculatedPerimeter = 0
        unknownSideValue = 0
    }
}
