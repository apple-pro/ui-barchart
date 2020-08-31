//
//  ContentView.swift
//  ui-barchart
//
//  Created by StartupBuilder.INFO on 8/31/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 1
    
    @State var data: [[CGFloat]] = [
        [1.0, 0.9, 0.5, 0.15, 0.9, 0.5, 0.8],
        [0.4, 0.9, 0.5, 0.14, 0.24, 0.5, 0.8],
        [0.7, 0.9, 0.5, 1.0, 0.9, 0.5, 0.8]
    ]
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            
            VStack {
                Text("Power Level")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Morning").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                HStack(spacing: 16) {
                    BarView(value: data[pickerSelectedItem][0], label: "Sun")
                    BarView(value: data[pickerSelectedItem][1], label: "Mon")
                    BarView(value: data[pickerSelectedItem][2], label: "Tue")
                    BarView(value: data[pickerSelectedItem][3], label: "Wed")
                    BarView(value: data[pickerSelectedItem][4], label: "Thu")
                    BarView(value: data[pickerSelectedItem][5], label: "Fri")
                    BarView(value: data[pickerSelectedItem][6], label: "Sat")
                }.padding(.top, 30)
                    .animation(.default)
                
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct BarView: View {
    
    @State var value: CGFloat
    let label: String
    
    var barColor: Color {
        get {
            switch value {
            case ...0.25:
                return Color(.systemRed)
            case 0.25...0.5:
                return Color(.systemOrange)
            default:
                return Color(.systemGreen)
            }
        }
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .frame(width: 30, height: 200, alignment: .center)
                    .foregroundColor(Color(.systemBackground))
                
                Capsule()
                    .frame(width: 30, height: 200 * value, alignment: .center)
                    .foregroundColor(barColor)
            }
            
            Text(label).font(.caption)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           ContentView()
            .environment(\.colorScheme, .light)
              .previewDisplayName("Light Mode")

           ContentView()
              .environment(\.colorScheme, .dark)
              .previewDisplayName("Dark Mode")
        }
    }
}
