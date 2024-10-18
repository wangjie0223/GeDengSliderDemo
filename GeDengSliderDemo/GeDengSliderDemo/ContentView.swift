//
//  ContentView.swift
//  GeDengSliderDemo
//
//  Created by 王杰 on 2024/10/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue: Float = 0
        @State private var previousStepMinValue: Float = 0.0

        var body: some View {
            VStack {
                Slider(value: $sliderValue, in: 0...24, step: 1)
                    .tint(.red)
                   .background(Color.gray.opacity(0.3))
                   .frame(height: 40)
        
                   .onChange(of: sliderValue) { oldValue, newValue in
                       let interval: Float = 1
                       let newValueRounded = round(newValue / interval) * interval
                       sliderValue = newValueRounded
                       if previousStepMinValue != sliderValue {
                           UISelectionFeedbackGenerator().selectionChanged()
                       }
                       previousStepMinValue = sliderValue
                   }
                   .padding(20)
                Text("当前进度：\(Int(sliderValue))")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
            }
        }
    
    
    
}

#Preview {
    ContentView()
}
