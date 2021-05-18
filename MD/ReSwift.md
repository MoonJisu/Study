## ReSwift

### Redux

- Store(저장소)
  - 전체 앱 상태를 단일 데이터 구조 형태로 저장
  - 이 상태는 조치를 저장소에 지정하여 수정 가능
  - 저장소의 상태가 변경될 때마다 저장소는 모든 관찰자에게 알림
- Action
  - 상태 변경을 설명하는 선언적 방법
  - 코드를 포함하지 않으며 저장소에서 사용되고 reducer로 전달됨
  - reducer는 각 작업에 대해 다른 상태 변경을 구현하여 작업 처리
- Reducer
  - 순수한 기능 제공
  - 현 작업과 현재 상태를 기반으로 새로운 앱 상태를 만든다



### 흐름

- AppDelegate 또는 전역변수에 메인 저장소 보관
- Action에서 상태를 변경하는 함수 선언
- Reducer에서 Action에서 선언했던 함수 구현
- Reducer로 상태를 변경하면 Store에서 상태 변화 감지
- 구독 중인 개체들에게 상태변화 알림

```swift
import ReSwift

let mainStore = Store<AppState>(
  reducer: counterReducer,
  state: nil
)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  ...
}
```

AppDelegate에 mainStore 보관



```swift
import ReSwift

struct AppState: StateType {
  var counter: Int = 0
}
```

state에 counter라는 변수 선언. 이 값이 변할 때마다 Store에서 변화를 감지하고 구독 중인 개체들에게 상태 변화를 알려쥼



```swift
import ReSwift

struct CounterActionIncrease: Action {}
struct CounterActionDecrease: Action {}
```

Action 선언



```swift
import ReSwift

func counterReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()
  
  switch action {
    case _ as CounterActionIncrease:
        state.counter += 1
    case _ as CounterActionDecrease:
        state.counter -= 1
    return state    	
  }
}
```

선언한 Action에 대한 리듀서의 구현, state의 counter의 값을 1 증가시키거나 감소시키는 코드



```swift
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

```

저장소를 구독하고 상태변화가 일어날 때 마다 counterLabel의 텍스트를 변경하는 viewController