//
//  String+ImageNames.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 24.03.2024.
//

extension String {
    func findMatchInDictionary(dictionary: [String: String]) -> String? {
        guard let _ = self.last else {
            return nil
        }
        
        let truncatedString = String(self.dropLast())
        
        if let matchingValue = dictionary[truncatedString] {
            return matchingValue
        } else {
            return nil
        }
    }
}
