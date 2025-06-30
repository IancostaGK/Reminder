//
//  String+Ext.swift
//  Reminder
//
//  Created by Ian Costa on 17/06/25.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
