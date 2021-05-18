//
//  State.swift
//  Study_ReSwift
//
//  Created by 문지수 on 2021/05/18.
//

import ReSwift

struct CounterActionIncrease: Action { }
struct CounterActionDecrease: Action { }

func counterReducer(action: Action, state: AppState?) -> AppState  {
    var state = state ?? AppState()
    
    switch action {
    case _ as CounterActionIncrease:
        state.counter += 1
    case _ as CounterActionDecrease:
        state.counter -= 1
    default:
        break
    }
    return state
}
