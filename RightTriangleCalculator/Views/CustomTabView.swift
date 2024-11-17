//
//  CustomTabView.swift
//  RightTriangleCalculator
//
//  Created by Dinith Fernando on 2024-11-15.
//

import SwiftUI

struct CustomTabView: View {
    var body: some View {
        TabView{
            Tab("Calculation", systemImage: "sum") {
                CalculationView()
            }
            .badge(2)
            
            
            Tab("History", systemImage: "line.3.horizontal") {
                HistoryView()
            }
            
        }
    }
}

#Preview {
    CustomTabView()
}
