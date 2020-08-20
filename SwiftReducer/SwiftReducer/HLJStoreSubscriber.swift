//
//  HLJStoreSubscriber.swift
//  reducerSwift
//
//  Created by Ye Keyon on 2020/8/19.
//  Copyright © 2020 dt. All rights reserved.
//

import UIKit

public protocol HLJAnyStoreSubscriber: class {
    func _newState(state: Any)
}

public protocol HLJStoreSubscriber: HLJAnyStoreSubscriber {
    associatedtype HLJStoreSubscriberStateType
    func newState(state: HLJStoreSubscriberStateType)
}

extension HLJStoreSubscriber {
    public func _newState(state: Any) {
        if let typedState = state as? HLJStoreSubscriberStateType {
            newState(state: typedState)
        }
    }
}
