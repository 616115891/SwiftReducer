//
//  HLJDispatchingStoreType.swift
//  reducerSwift
//
//  Created by Ye Keyon on 2020/8/19.
//  Copyright © 2020 dt. All rights reserved.
//

import UIKit

public protocol HLJDispatchingStoreType {
    func dispatch(_ action: HLJAction)
}
