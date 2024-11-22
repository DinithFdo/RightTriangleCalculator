//
//  ContentView.swift
//  RightTriangleCalculator
//
//  Created by Dinith Fernando on 2024-11-11.
//

import SwiftUI

enum UnknownSide: String, CaseIterable{
    case base = "Base"
    case altitude = "Altitude"
    case hypotenus = "Hypotenus"
}

struct CalculationView: View {
    
    @ObservedObject var calculationViewVM: CalculationViewVM
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    Image("RightAngledTriangle")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                
                HStack{
                    Text("Choose the unknown edge")
                        .bold()
                    Picker("Flavor", selection: $calculationViewVM.unknownSide) {
                        Text("Base").tag(UnknownSide.base)
                        Text("Altitude").tag(UnknownSide.altitude)
                        Text("Hypoteus").tag(UnknownSide.hypotenus)
                    }
                    .pickerStyle(.wheel)
                    .onChange(of: calculationViewVM.unknownSide) {
                        calculationViewVM.reset()
                    }
                    
                }
                .padding()
                
                Section{
                    VStack(alignment:.leading){
                        Text("Enter known length values")
                            .bold()
                        
                        ForEach(UnknownSide.allCases.filter { $0 != calculationViewVM.unknownSide }, id: \.self) { side in
                            TextField("Enter \(side.rawValue)", text: binding(for: side))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                    
                    HStack(alignment: .center) {
                        Button("Calculate"){
                            calculationViewVM.calculate()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        .padding(.vertical)
                        
                        Button("Reset"){
                            calculationViewVM.reset()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                        .padding(.vertical)
                    }
                    
                }
                
                Section{
                    VStack(alignment:.leading){
                        HStack{
                            Text("\(calculationViewVM.unknownSide.rawValue)")
                            Spacer()
                            Text(String(calculationViewVM.unknownSideValue))
                        }
                        
                        HStack{
                            Text("Area")
                            Spacer()
                            Text(String(calculationViewVM.calculatedArea))
                        }
                        
                        HStack {
                            Text("Perimeter")
                            Spacer()
                            Text(String(calculationViewVM.calculatedPerimeter))
                        }
                    }
                }
            }
            .navigationTitle("Triangle Calculator")
        }
        .padding()
        
    }
    
    private func binding(for side: UnknownSide) -> Binding<String> {
        switch side {
        case .base:
            return $calculationViewVM.base
        case .altitude:
            return $calculationViewVM.altitude
        case .hypotenus:
            return $calculationViewVM.hypotenus
        }
    }
}

#Preview {
    CalculationView(calculationViewVM: CalculationViewVM())
}
