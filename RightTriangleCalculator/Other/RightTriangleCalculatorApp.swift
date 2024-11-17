//
//  RightTriangleCalculatorApp.swift
//  RightTriangleCalculator
//
//  Created by Dinith Fernando on 2024-11-11.
//

import SwiftUI

@main
struct RightTriangleCalculatorApp: App {
    
    @StateObject var calculationViewVM = CalculationViewVM()
    
    var body: some Scene {
        WindowGroup {
            CustomTabView().environmentObject(calculationViewVM)
        }
    }
}
