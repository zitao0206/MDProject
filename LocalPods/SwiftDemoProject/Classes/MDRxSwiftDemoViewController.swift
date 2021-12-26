//
//  Test.swift
//  MDProject
//
//  Created by Leon0206 on 2021/8/18.
//  Copyright © 2021 Leon0206. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

@objc(MDOCRxSwiftDemoViewController)
@objcMembers
public class MDRxSwiftDemoViewController : UIViewController {
   
    let disposeBag = DisposeBag()
    
    lazy var closeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("点击", for:  UIControl.State.normal)//设置标题
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)//设置字体大小
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(clickCloseEvent), for: .touchUpInside)
        btn.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        btn.frame = CGRect.init(x: 10, y: 0, width: 100, height: 40);
        return btn
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(closeBtn）
        
        // example 1
//        self.closeBtn.rx.controlEvent(.touchUpInside).subscribe { () in
//            print("123")
//        } onDisposed: {
//            print("456")
//        } .disposed(by: disposeBag)
//
//
//        // example 2
//        Observable.repeatElement("hello Swift")
//        .take(3)
//        .subscribe(onNext: { print($0) })
//        .disposed(by: disposeBag)
//
//        // example 3
//        Observable.of("?", "?", "?", "?")
//        .subscribe { (element) in
//                print(element)
//        } onDisposed: {
//
//        }.disposed(by: disposeBag)
//
//        // example 4
//        let obs = Observable.from(["1", "2", "3", "4"])
//        .subscribe(onNext: { print($0) })
//        obs.disposed(by: disposeBag)
//
//        // example 5
//        Observable.repeatElement("&")
//        .take(3)
//        .subscribe(onNext: { print($0) })
//        .disposed(by: disposeBag)
//
//        // example 6
//        let subject = ReplaySubject<String>.create(bufferSize: 1)
//        subject.onNext("?")
//        subject.onNext("?")
                        
//        example00()
//        example01()
//        example02()
//        example03()
//        example04()
//        example05()
//        example06()
//        example07()
//        example08()
//        example09()
//        example10()
//        example11()
        
//        example12()
//        example13()
//        example14()
//        example15()
//        example16()
//        example18()
//        example19()
//        example21()
//        example22()
//        example23()
//        example24()
//        example25()
//        example26()
//        example27()
//        example28()
//        example29()
//        example30()
//        example31()
//        example32()
//        example33()
        example34()
        view.backgroundColor = UIColor.white
    }
    
    func example34() {
        Observable.of(10, 100, 1000)
        .reduce(1, accumulator: +)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
          
    func example33() {
        Observable.range(start: 1, count: 10)
        .toArray()
        .subscribe { print($0) }
        .disposed(by: disposeBag)
    }
    
    func example32() {
        let sourceSequence = PublishSubject<String>()
        let referenceSequence = PublishSubject<String>()

        sourceSequence
        .skip(until: referenceSequence)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)

        sourceSequence.onNext("1")
        sourceSequence.onNext("2")
        sourceSequence.onNext("3")

        referenceSequence.onNext("4")

        sourceSequence.onNext("5")
        sourceSequence.onNext("6")
        sourceSequence.onNext("7")
    }
                        
    func example31() {
        Observable.of(1, 2, 3, 4, 5, 6)
        .skip(while: { $0 < 4 } )
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
    
    func example30() {
        Observable.of("1", "2", "3", "4", "5", "6")
        .skip(2)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
    
    func example29() {
        let sourceSequence = PublishSubject<String>()
        let referenceSequence = PublishSubject<String>()

        sourceSequence
        .take(until:referenceSequence)
        .subscribe { print($0) }
        .disposed(by: disposeBag)
        sourceSequence.onNext("?")
        sourceSequence.onNext("?")
        sourceSequence.onNext("?")
        referenceSequence.onNext("?")    //停止接收消息
        sourceSequence.onNext("?")
        sourceSequence.onNext("?")
        sourceSequence.onNext("?")
    }
    
    func example28() {
        Observable.of(1, 2, 3, 4, 5, 6)
        .take(while: {$0 < 4 })
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
    
    func example27() {
        Observable.of("1", "2", "3", "4", "5", "6")
        .takeLast(3)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
        
    func example26() {
        Observable.of("1", "2", "3", "4", "5", "6")
        .take(3)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
    
    func example25() {
        Observable.of("?", "?", "?", "?", "?", "?")
        .single()
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
        
    }
    
    func example24() {
        Observable.of("1", "2", "3", "4", "5", "6")
        .element(at:3)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
    
    func example23() {
        Observable.of("?", "?", "?", "?", "?", "?", "?")
        .distinctUntilChanged()
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
    
    func example22() {
        Observable.of(
        "1", "2", "3",
        "?", "?", "?",
        "4", "5", "6")
        .filter {
            $0 == "?"
        }
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }

    func example21() {

        Observable.of(10, 100, 1000)
        .scan(1) { aggregateValue, newValue in
            aggregateValue + newValue
        }
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
    
    func example19() {
        //每一个元素自己相乘
        Observable.of(1, 2, 3)
        .map { $0 * $0 }
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }

    func example18() {
        let stringSubject = PublishSubject<String>()
        let intSubject = PublishSubject<Int>()

        Observable.combineLatest(stringSubject, intSubject) { stringElement, intElement in
                "\(stringElement) \(intElement)"
            }
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)

        stringSubject.onNext("?️")
        stringSubject.onNext("?️")
        intSubject.onNext(1)
        intSubject.onNext(2)
        stringSubject.onNext("?")
    }
    
    func example17() {
        let stringSubject = PublishSubject<String>()
        let intSubject = PublishSubject<Int>()

        Observable.zip(stringSubject, intSubject) { stringElement, intElement in
            "\(stringElement) \(intElement)"
            }
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)

        stringSubject.onNext("?️")
        stringSubject.onNext("?️")

        intSubject.onNext(1)

        intSubject.onNext(2)

        stringSubject.onNext("?")
        intSubject.onNext(3)
    }
    
    func example16() {
        let subject1 = PublishSubject<String>()
        let subject2 = PublishSubject<String>()

        Observable.of(subject1, subject2)
        .merge()
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)

        subject1.onNext("?️")
        subject1.onNext("?️")
        subject2.onNext("①")
        subject2.onNext("②")
        subject1.onNext("?")
        subject2.onNext("③")
    }
    
    
    func example15() {
        Observable.of("2", "3")
        .startWith("1")
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
    
   func example14() {
        let subject = ReplaySubject<String>.create(bufferSize: 2)
        
        subject.onNext("1")
        subject.onNext("2")
        subject.onNext("3")
        
        subject.subscribe(onNext: { (element) in
           print("订阅者一：" + element)
        }).disposed(by: disposeBag)
    }

    func example13 () {
        let subject = BehaviorSubject(value: "1")
        
        subject.onNext("1")
        
        subject.subscribe(onNext: { (element) in
            print("订阅者一：" + element)
        }).disposed(by: disposeBag)
        
        subject.on(.next("2"))
        subject.on(.next("3"))
        
        subject.subscribe(onNext: { (element) in
            print("订阅者二：" + element)
        }).disposed(by: disposeBag)
        
        subject.onNext("4")
    }
    
    func example12() {
        let subject = PublishSubject<String>()
          
          subject.onNext("1")
          
          let subscriptionOne = subject.subscribe(onNext: { (element) in
              print("订阅者一：" + element)
          }).disposed(by: disposeBag)
          
          subject.on(.next("2"))
          
          let subscriptionTwo = subject.subscribe(onNext: { (element) in
              print("订阅者二：" + element)
          }).disposed(by: disposeBag)
          
          subject.onNext("3")
    }
    
    
    func example11() {
        Observable.of("1", "2", "3", "4")
        .do(onNext: { print("Intercepted:", $0) }, onError: { print("Intercepted error:", $0) }, onCompleted: { print("Completed")  })
        .subscribe(onNext: { print($0) },onCompleted: { print("结束") })
        .disposed(by: disposeBag)
    }
        
    
//    func example10() {
//        Observable<Int>.error(TestError.test)
//        .subscribe { print($0) }
//        .disposed(by: disposeBag)
//    }
    
    func example09() {
        var count = 1
        let deferredSequence = Observable<String>.deferred {
            print("Creating \(count)")
            count += 1

            return Observable.create { observer in
                print("Emitting...")
                observer.onNext("?")
                observer.onNext("?")
                observer.onNext("?")
                return Disposables.create()
            }
        }

        deferredSequence
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)

        deferredSequence
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
    
    func example08() {
        Observable.generate(
            initialState: 0,
            condition: { $0 < 3 },
            iterate: { $0 + 1 }
        )
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
    
    func example07() {
        Observable.repeatElement("#")
        .take(3)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
    
    func example06() {
        Observable.range(start: 3, count: 5)
        .subscribe { print($0) }
        .disposed(by: disposeBag)
    }
    
    func example05() {
        let myJust = { (element: String) -> Observable<String> in
            return Observable.create { observer in
                observer.on(.next(element))
                observer.on(.completed)
                return Disposables.create()
            }
        }

        myJust("?")
        .subscribe { print($0) }
        .disposed(by: disposeBag)
    }
    
    func example04() {
        Observable.from(["1", "2", "3", "4"])
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    }
    
    func example03() {
        Observable.of("?", "?", "?", "?")
        .subscribe({ element in
            print(element)
        }).disposed(by: disposeBag)
    }
    
    func example02() {
        Observable.just("?")
        .subscribe { event in
            print(event)
        }.disposed(by: disposeBag)
    }
    
    func example01() {
        Observable<Int>.empty()
        .subscribe { event in
            print(event)
        }.disposed(by: disposeBag)
    }
    
    func example00() {
        Observable<String>.never()
        .subscribe { _ in
            print("This will never be printed")
        }.disposed(by: disposeBag)
    }


    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
 
        closeBtn.center = view.center
    }
    
    func clickCloseEvent() {
        print("clicked...")
    }
    
    func show() {
        print("hello swift...")
    }
}
