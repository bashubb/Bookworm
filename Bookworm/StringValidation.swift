//
//  StringValidation.swift
//  Bookworm
//
//  Created by HubertMac on 19/10/2023.
//

import SwiftUI

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
