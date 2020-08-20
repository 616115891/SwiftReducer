//
//  StoreType.swift
//  reducerSwift
//
//  Created by Ye Keyon on 2020/8/19.
//  Copyright © 2020 dt. All rights reserved.
//

import UIKit

public protocol HLJStoreType {
    associatedtype State: HLJStateType
    var state:State! { get }
    func subscribe<S: HLJStoreSubscriber>(_ subscriber: S) where S.HLJStoreSubscriberStateType == State
    func unsubscribe(_ subscriber: HLJAnyStoreSubscriber)
}
