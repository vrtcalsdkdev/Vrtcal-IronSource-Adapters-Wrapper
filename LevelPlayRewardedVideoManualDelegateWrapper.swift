//
//  LevelPlayRewardedVideoManualDelegateWrapper.swift
//  Vrtcal-IronSource-Adapters-Wrapper
//
//  Created by Scott McCoy on 4/9/24.
//

import Vrtcal_Adapters_Wrapper_Parent
import IronSource

class LevelPlayRewardedVideoManualDelegateWrapper: NSObject, LevelPlayRewardedVideoManualDelegate {

    var sdkEventsLogger: Logger
    var appLogger: Logger
    
    init(
        sdkEventsLogger: Logger,
        appLogger: Logger
    ) {
        self.sdkEventsLogger = sdkEventsLogger
        self.appLogger = appLogger
    }

    func didLoad(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didLoad")
        appLogger.log("adInfo: \(adInfo!)")
    }
    
    func didFailToLoadWithError(_ error: Error!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didFailToLoadWithError: \(String(describing:error))")
        appLogger.log("error: \(error!)")
    }
    
    func didOpen(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didOpen")
        appLogger.log("adInfo: \(adInfo!)")
    }
    
    func didClose(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didClose")
        appLogger.log("adInfo: \(adInfo!)")
    }
    
    func didShow(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didShow")
        appLogger.log("adInfo: \(adInfo!)")
    }
    
    func didFailToShowWithError(_ error: (any Error)!, andAdInfo adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didFailToShowWithError")
        appLogger.log("adInfo: \(adInfo!)")
    }
    
    func didClick(_ placementInfo: ISPlacementInfo!, with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didClick")
        appLogger.log("adInfo: \(adInfo!)")
    }
    
    func didReceiveReward(forPlacement placementInfo: ISPlacementInfo!, with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didReceiveReward")
        appLogger.log("adInfo: \(adInfo!)")
    }
}
