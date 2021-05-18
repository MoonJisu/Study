//
//  ViewController.swift
//  Study_ReSwift
//
//  Created by 문지수 on 2021/05/18.
//

import UIKit
import ReSwift

class ViewController: UIViewController, StoreSubscriber {

    typealias StoreSubscriberStateType = AppState
    
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainStore.subscribe(self)
    }
    
    func newState(state: AppState) {
        counterLabel.text = "\(mainStore.state.counter)"
    }
    
    @IBAction func downTouch(_ sender: AnyObject) {
        mainStore.dispatch(CounterActionDecrease());
    }
    
    @IBAction func upTouch(_ sender: AnyObject) {
        mainStore.dispatch(CounterActionIncrease());
    }
}
