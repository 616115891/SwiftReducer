//
//  HLJSubscription.swift
//  reducerSwift
//
//  Created by Ye Keyon on 2020/8/19.
//  Copyright © 2020 dt. All rights reserved.
//

import UIKit

class HLJSubscriptionBox<State>: Hashable {
    
    weak var subscriber: HLJAnyStoreSubscriber?
    private let objectIdentifier: ObjectIdentifier
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.objectIdentifier)
    }
    
    init(subscriber: HLJAnyStoreSubscriber) {
        self.subscriber = subscriber
        self.objectIdentifier = ObjectIdentifier(subscriber)
    }
    
    func newValues(oldState: State?, newState: State) {
        self.subscriber?._newState(state: newState)
    }
    
    static func == (lhs: HLJSubscriptionBox<State>, rhs: HLJSubscriptionBox<State>) -> Bool {
        return lhs.objectIdentifier == rhs.objectIdentifier
    }
}
