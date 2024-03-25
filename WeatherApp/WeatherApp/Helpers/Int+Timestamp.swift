//
//  Int+Timestamp.swift
//  WeatherApp
//
//  Created by Polina Egorova on 25.03.2024.
//

import Foundation

extension Int {
    func getDayOfWeek() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let calendar = Calendar.current
        
        if calendar.isDateInToday(date) {
            return "Today"
        } else {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_EN")
            formatter.dateFormat = "EEE"
            return formatter.string(from: date)
        }
    }
    
    func nextDayOfWeek() -> Int? {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let calendar = Calendar.current
        
        if let nextDate = calendar.date(byAdding: .day, value: 1, to: date) {
            return Int(nextDate.timeIntervalSince1970)
        }
        
        return nil
    }
}
