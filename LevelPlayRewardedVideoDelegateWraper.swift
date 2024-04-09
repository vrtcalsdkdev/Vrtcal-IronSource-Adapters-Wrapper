//
//  LevelPlayRewardedVideoDelegateWraper.swift
//  Vrtcal-IronSource-Adapters-Wrapper
//
//  Created by Scott McCoy on 4/9/24.
//

import Vrtcal_Adapters_Wrapper_Parent
import IronSource

class LevelPlayRewardedVideoDelegateWraper: NSObject, LevelPlayRewardedVideoDelegate {

    
    var sdkEventsLogger: Logger
    
    init(sdkEventsLogger: Logger) {
        self.sdkEventsLogger = sdkEventsLogger
    }
    
    func didReceiveReward(forPlacement placementInfo: ISPlacementInfo!, with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoDelegate didReceiveReward placementInfo: \(placementInfo!), adInfo: \(adInfo!)")
    }

    func hasAvailableAd(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoDelegate hasAvailableAd adInfo: \(adInfo!)")
    }
    
    func hasNoAvailableAd() {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoDelegate hasNoAvailableAd")
    }
    
    func didClick(_ placementInfo: ISPlacementInfo!, with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoDelegate didClick placementInfo: \(placementInfo!), adInfo: \(adInfo!)")
    }
    
    func didFailToShowWithError(_ error: (any Error)!, andAdInfo adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoDelegate didFailToShowWithError adInfo: \(adInfo!)")
    }
    
    func didOpen(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoDelegate didOpen adInfo: \(adInfo!)")
    }
    
    func didClose(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayRewardedVideoDelegate didClose adInfo: \(adInfo!)")
    }
}
