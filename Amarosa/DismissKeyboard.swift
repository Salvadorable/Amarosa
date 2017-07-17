//
//  DismissKeyboard.swift
//  Amarosa
//
//  Created by Sean Perez on 7/17/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
