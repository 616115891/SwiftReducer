//
//  HLJReducer.swift
//  reducerSwift
//
//  Created by Ye Keyon on 2020/8/19.
//  Copyright © 2020 dt. All rights reserved.
//

import UIKit

public typealias HLJReducer<HLJReducerStateType> = (_ action: HLJAction, _ state: HLJReducerStateType?) -> HLJReducerStateType
