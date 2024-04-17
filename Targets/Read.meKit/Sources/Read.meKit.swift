//
//  Read.meKit.swift
//  Read.meKit
//
//  Created by Automated on 17/04/2024.
//  Copyright © 2024 CompanyName. All rights reserved.
//

import Foundation
import LoggingKit

public struct Read.meKit {
    public static func hello() {
        LogService.shared.info("Hello from Read.meKit", logCategory: \.default)
    }
}