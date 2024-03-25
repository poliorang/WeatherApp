//
//  String+Normalized.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 25.03.2024.
//

extension String {
    var trimmedAndNormalized: String {
        return split(separator: " ").joined(separator: " ")
    }
}
