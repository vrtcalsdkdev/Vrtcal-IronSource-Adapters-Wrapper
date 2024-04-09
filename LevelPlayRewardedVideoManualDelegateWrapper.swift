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
    
    init(sdkEventsLogger: Logger) {
        self.sdkEventsLogger = sdkEventsLogger
    }
    
    func didLoad(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didLoad adInfo: \(adInfo!)")
    }
    
    func didFailToLoadWithError(_ error: Error!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didFailToLoadWithError: \(String(describing:error))")
    }
    
    func didOpen(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didOpen adInfo: \(adInfo!)")
    }
    
    func didClose(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didClose adInfo: \(adInfo!)")
    }
    
    func didShow(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didShow adInfo: \(adInfo!)")
    }
    
    func didFailToShowWithError(_ error: (any Error)!, andAdInfo adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didFailToShowWithError adInfo: \(adInfo!)")
    }
    
    func didClick(_ placementInfo: ISPlacementInfo!, with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didClick adInfo: \(adInfo!)")
    }
    
    func didReceiveReward(forPlacement placementInfo: ISPlacementInfo!, with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoManualDelegate didReceiveReward placementInfo: \(placementInfo!), adInfo: \(adInfo!)")
    }
}
