//
//  ViewController.swift
//  SwiftReducer
//
//  Created by Ye Keyon on 2020/8/20.
//  Copyright © 2020 dt. All rights reserved.
//

import UIKit

let mainStore = HLJStore<AppState>(
    reducer: counterReducer,
    state: AppState(counter: 10)
)

class ViewController: UIViewController, HLJStoreSubscriber {

    @IBOutlet weak var counterLabel: UILabel!
    
    typealias HLJStoreSubscriberStateType = AppState
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainStore.subscribe(self)
    }
    
    func newState(state: AppState) {
        debugPrint("\(mainStore.state.counter)")
        counterLabel.text = "\(mainStore.state.counter)"
    }

    @IBAction func downTouch(_ sender: AnyObject) {
        mainStore.dispatch(CounterActionDecrease());
    }
    @IBAction func upTouch(_ sender: AnyObject) {
        mainStore.dispatch(CounterActionIncrease());
    }
    
}

