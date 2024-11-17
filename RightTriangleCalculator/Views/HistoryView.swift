//
//  HistoryView.swift
//  RightTriangleCalculator
//
//  Created by Dinith Fernando on 2024-11-15.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var calculationViewVM:CalculationViewVM
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Altitude")
                    Spacer()
                    Text("\(calculationViewVM.altitudeValue)")
                }
                HStack{
                    Text("Base")
                    Spacer()
                    Text("\(calculationViewVM.baseValue)")
                }
                HStack{
                    Text("Hypotenuse")
                    Spacer()
                    Text("\(calculationViewVM.hypotenusValue)")
                }
                HStack{
                    Text("Area")
                    Spacer()
                    Text("\(calculationViewVM.areaValue)")
                }
                HStack{
                    Text("Perimeter")
                    Spacer()
                    Text("\(calculationViewVM.perimeterValue)")
                }
                
                Spacer()
                
            }
            .navigationTitle("Last Calculations")
            .padding()
        }
    }
}

#Preview {
    HistoryView()
}
