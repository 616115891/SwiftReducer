//
//  Store.swift
//  reducerSwift
//
//  Created by Ye Keyon on 2020/8/19.
//  Copyright © 2020 dt. All rights reserved.
//

import UIKit

class HLJStore<State: HLJStateType>: HLJStoreType {
    
    typealias SubscriptionType = HLJSubscriptionBox<State>
    
    private(set) public var state: State! {
        didSet {
            subscriptions.forEach { (subscriptionBox) in
                if let _ = subscriptionBox.subscriber {
                    subscriptionBox.newValues(oldState: oldValue, newState: state)
                } else {
                    subscriptions.remove(subscriptionBox)
                }
            }
        }
    }
    
    private var reducer: HLJReducer<State>
    
    private var subscriptions: Set<SubscriptionType> = []
    
    private var isDispacthing = false

    public required init(reducer: @escaping HLJReducer<State>, state: State?) {
        self.reducer = reducer
        if let state = state {
            self.state = state
        } else {
            dispatch(HLJReducerInit())
        }
    }
    
    func unsubscribe(_ subscriber: HLJAnyStoreSubscriber) {
        if let index = subscriptions.firstIndex(where: { (subscriptionBox) -> Bool in
            return subscriptionBox.subscriber === subscriber
        }) {
            subscriptions.remove(at: index)
        }
    }
    
    func dispatch(_ action: HLJAction) {
        self._defaultDispatch(action: action)
    }
    
    func subscribe<S: HLJStoreSubscriber>(_ subscriber: S) where State == S.HLJStoreSubscriberStateType {
        let subscriptionBox = HLJSubscriptionBox<State>.init(subscriber: subscriber)
        subscriptions.update(with: subscriptionBox)
        if let state = self.state {
            subscriptionBox.newValues(oldState: nil, newState: state)
        }
    }
    
    open func _defaultDispatch(action: HLJAction) {
        guard !isDispacthing else {
            debugPrint(
                "ConcurrentMutationError- Action has been dispatched while" +
                " a previous action is action is being processed. A reducer" +
                " is dispatching an action, or ReSwift is used in a concurrent context" +
                " (e.g. from multiple threads)."
            )
            return
        }

        isDispacthing = true
        let newState = reducer(action, state)
        isDispacthing = false

        state = newState
    }
}
