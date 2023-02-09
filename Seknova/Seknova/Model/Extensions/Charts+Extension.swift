//
//  Charts+Extension.swift
//  Seknova
//
//  Created by imac on 2023/2/6.
//

import Foundation
import Charts

class ChartsXAxisFormatter: NSObject {
    fileprivate var dateFormatter: DateFormatter?
    fileprivate var timeInterval: TimeInterval?
    
    convenience init(dateFormatter: DateFormatter, timeInterval: TimeInterval) {
        self.init()
        self.dateFormatter = dateFormatter
        self.timeInterval = timeInterval
    }
}

extension ChartsXAxisFormatter: AxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatterPrint = DateFormatter()
        let date = Date(timeIntervalSince1970: value)
        
        dateFormatterPrint.dateFormat = "HH:mm"
        
        return dateFormatterPrint.string(from: date)
    }
}
