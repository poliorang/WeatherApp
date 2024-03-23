//
//  UIKit+AutoLayout.swift
//  VKMarketTask
//
//  Created by Polina Egorova 22.03.2024.
//

import UIKit

public extension UIView {
    static func autolayout() -> Self {
        let view = self.init()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }

    @discardableResult
    func autolayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        return self
    }
}
