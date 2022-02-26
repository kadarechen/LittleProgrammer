//
//  DelayTool.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/30.
//
//https://www.jianshu.com/p/912330910458


import Foundation
typealias Task = (_ cancel: Bool) -> Void
    /// 代码延迟运行
    ///
    /// - Parameters:
    ///   - delayTime: 延时时间。比如：.seconds(5)、.milliseconds(500)
    ///   - qosClass: 要使用的全局QOS类（默认为 nil，表示主线程）
    ///   - task: 延迟运行的代码
    /// - Returns: Task?
    @discardableResult
func delay(by delayTime: TimeInterval, qosClass: DispatchQoS.QoSClass? = nil, _ task: @escaping () -> Void) -> Task? {
        
        func dispatch_later(block: @escaping () -> Void) {
            let dispatchQueue = qosClass != nil ? DispatchQueue.global(qos: qosClass!) : .main
            dispatchQueue.asyncAfter(deadline: .now() + delayTime, execute: block)
        }
        
        var closure: (() -> Void)? = task
        var result: Task?
        
        let delayedClosure: Task = { cancel in
            if let internalClosure = closure {
                if !cancel {
                    DispatchQueue.main.async(execute: internalClosure)
                }
            }
            closure = nil
            result = nil
        }
        
        result = delayedClosure
        
        dispatch_later {
            if let delayedClosure = result {
                delayedClosure(false)
            }
        }
        
        return result
        
    }

    /// 取消代码延时运行
    func delayCancel(_ task: Task?) {
        task?(true)
    }


/// GCD定时器倒计时
///
/// - Parameters:
///   - timeInterval: 间隔时间
///   - repeatCount: 重复次数
///   - handler: 循环事件,闭包参数: 1.timer 2.剩余执行次数
func dispatchTimer(timeInterval: Double, repeatCount: Int, handler: @escaping (DispatchSourceTimer?, Int) -> Void) {
    
    if repeatCount <= 0 {
        return
    }
    let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
    var count = repeatCount
    timer.schedule(deadline: .now(), repeating: timeInterval)
    timer.setEventHandler {
        count -= 1
        DispatchQueue.main.async {
            handler(timer, count)
        }
        if count == 0 {
            timer.cancel()
        }
    }
    timer.resume()
    
}
