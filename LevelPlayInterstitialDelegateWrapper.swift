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
    
    init(sdkEventsLogger: Logger) {
        self.sdkEventsLogger = sdkEventsLogger
    }
    
    func didLoad(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didLoad adInfo: \(adInfo!)")
    }
    
    func didFailToLoadWithError(_ error: Error!) {
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didFailToLoadWithError: \(String(describing:error))")
    }
    
    func didOpen(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didOpen adInfo: \(adInfo!)")
    }
    
    func didClose(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didClose adInfo: \(adInfo!)")
    }
    
    func didShow(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didShow adInfo: \(adInfo!)")
    }
    
    func didFailToShowWithError(_ error: (any Error)!, andAdInfo adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didFailToShowWithError adInfo: \(adInfo!)")
    }
    
    func didClick(with adInfo: ISAdInfo!) {
        sdkEventsLogger.log("IronSource LevelPlayInterstitialDelegate didClick adInfo: \(adInfo!)")
    }
}
