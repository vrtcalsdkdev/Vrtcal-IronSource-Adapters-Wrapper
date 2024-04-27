//
//  LevelPlayInterstitialDelegateWrapper.swift
//  Vrtcal-IronSource-Adapters-Wrapper
//
//  Created by Scott McCoy on 4/9/24.
//

import Vrtcal_Adapters_Wrapper_Parent
import IronSource

class LevelPlayInterstitialDelegateWrapper: NSObject, LevelPlayInterstitialDelegate {
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
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didLoad")
        appLogger.log("adInfo: \(adInfo!)")
    }
    
    func didFailToLoadWithError(_ error: Error!) {
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didFailToLoadWithError: \(String(describing:error))")
    }
    
    func didOpen(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didOpen")
        appLogger.log("adInfo: \(adInfo!)")
    }
    
    func didClose(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didClose")
        appLogger.log("adInfo: \(adInfo!)")
    }
    
    func didShow(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didShow")
        appLogger.log("adInfo: \(adInfo!)")
    }
    
    func didFailToShowWithError(_ error: (any Error)!, andAdInfo adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didFailToShowWithError")
        appLogger.log("adInfo: \(adInfo!)")
    }
    
    func didClick(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didClick")
        appLogger.log("adInfo: \(adInfo!)")
    }
}
