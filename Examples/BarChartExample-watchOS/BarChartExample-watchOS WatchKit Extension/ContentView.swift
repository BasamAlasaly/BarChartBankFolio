//
//  ContentView.swift
//  BarChartExample-watchOS WatchKit Extension
//
//  Copyright (c) 2020 Roman Baitaliuk
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.

import SwiftUI
import BarChart

struct ContentView: View {
    
    // MARK: - Chart Properties
    
    let font = CTFontCreateWithName(("SFProText-Regular" as CFString), 8, nil)
    let config = ChartConfiguration()
    
    var body: some View {
        GeometryReader { geometry in
            BarChartView()
                .modifying(\.config, value: self.config)
                .modifying(\.config.data.entries, value: self.randomEntries())
                .modifying(\.config.xAxis.labelsColor, value: .white)
                .modifying(\.config.xAxis.ticksColor, value: .white)
                .modifying(\.config.xAxis.labelsCTFont, value: self.font)
                .modifying(\.config.yAxis.labelsCTFont, value: self.font)
                .modifying(\.config.yAxis.minTicksSpacing, value: 20.0)
                .modifying(\.config.yAxis.labelsColor, value: .white)
                .modifying(\.config.yAxis.ticksColor, value: .white)
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    // MARK: - Random Helpers
    
    func randomEntries() -> [ChartDataEntry] {
        var entries = [ChartDataEntry]()
        for data in 0..<8 {
            let randomDouble = Double.random(in: 5...15)
            let newEntry = ChartDataEntry(x: "\(data)", y: randomDouble)
            entries.append(newEntry)
        }
        return entries
    }
}