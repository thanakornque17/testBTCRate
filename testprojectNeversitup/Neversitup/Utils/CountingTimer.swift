//
//  CountingTimer.swift
//  testprojectNeversitup
//
//  Created by Thanakorn Phungluang on 18/4/2566 BE.
//

import Foundation
import UIKit

public class CountingTimer {
    
    public var countingTimer: Timer?
    public var limit: Int!
    public var timeInterval: Double = 1.0
    public var onTimerStart: ((_ remainingSecond: Int) -> Void)?
    public var onTimerCount: ((_ remainingSecond: Int) -> Void)?
    public var onTimerStop: ((_ remainingSecond: Int) -> Void)?
    
    public init() {
        UIApplication.shared.beginBackgroundTask(withName: "CountingTimer") { [weak self] in
            guard let self = self else { return }
            self.start()
        }
    }
    
    public func start() {
        if countingTimer != nil || limit == 0 {
            return
        }
        limit += 1
        countingTimer = Timer.scheduledTimer(timeInterval: timeInterval,
                                             target: self,
                                             selector: #selector(self.counting),
                                             userInfo: nil,
                                             repeats: true)
        countingTimer?.tolerance = 0.15
        RunLoop.current.add(countingTimer!, forMode: RunLoop.Mode.common)
        onTimerStart?(limit)
    }
    
    public func stop() {
        countingTimer?.invalidate()
        countingTimer = nil
        onTimerStop?(limit)
    }
    
    @objc public func counting() {
        limit -= 1
        onTimerCount?(limit)
        if limit == 0 {
            stop()
        }
    }
}
