//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Ian Costa on 30/06/25.
//

import Foundation
import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginData(email: String, password: String)
}
