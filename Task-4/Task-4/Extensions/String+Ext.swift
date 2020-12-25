//
//  String+Ext.swift
//  Task-4
//
//  Created by Yaroslav Hrytsun on 25.12.2020.
//

import Foundation

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
