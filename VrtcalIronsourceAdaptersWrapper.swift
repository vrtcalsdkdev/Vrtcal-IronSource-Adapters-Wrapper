import Vrtcal_Adapters_Wrapper_Parent
import IronSource

// Must be NSObject for ISInitializationDelegate
class VrtcalIronsourceAdaptersWrapper: NSObject, AdapterWrapperProtocol {
    
    var appLogger: Logger
    var sdkEventsLogger: Logger
    var sdk = SDK.ironSource
    var delegate: AdapterWrapperDelegate
    
    var levelPlayInterstitialDelegateWrapper: LevelPlayInterstitialDelegateWrapper
    var levelPlayRewardedVideoDelegateWraper: LevelPlayRewardedVideoDelegateWraper
    var levelPlayRewardedVideoManualDelegateWrapper: LevelPlayRewardedVideoManualDelegateWrapper
    
    required init(
        appLogger: Logger,
        sdkEventsLogger: Logger,
        delegate: AdapterWrapperDelegate
    ) {
        self.appLogger = appLogger
        self.sdkEventsLogger = sdkEventsLogger
        self.delegate = delegate
        
        levelPlayInterstitialDelegateWrapper = LevelPlayInterstitialDelegateWrapper(
            sdkEventsLogger: sdkEventsLogger,
            appLogger: appLogger
        )

        levelPlayRewardedVideoDelegateWraper = LevelPlayRewardedVideoDelegateWraper(
            sdkEventsLogger: sdkEventsLogger
        )
        
        levelPlayRewardedVideoManualDelegateWrapper = LevelPlayRewardedVideoManualDelegateWrapper(
            sdkEventsLogger: sdkEventsLogger,
            appLogger: appLogger
        )
    }
    
    func initializeSdk() {
        appLogger.log()

        // This init is for VRTAsSecondary. VRTAsPrimary inits IronSource by itself.
        IronSource.setLevelPlayInterstitialDelegate(levelPlayInterstitialDelegateWrapper)
        IronSource.setLevelPlayRewardedVideoDelegate(levelPlayRewardedVideoDelegateWraper)
        IronSource.setLevelPlayRewardedVideoManualDelegate(levelPlayRewardedVideoManualDelegateWrapper)
        IronSource.add(self)
        
        let appKey: String
        switch App.current {
            case .none: appKey = ""
            case .twitMore: appKey = "133bd4b31"
            case .vita: appKey = "133bdf7c9" // VRTAsSecondary
        }

        IronSource.initWithAppKey(appKey, adUnits:[IS_INTERSTITIAL, IS_REWARDED_VIDEO], delegate: self)
    }
    
    func handle(adTechConfig: AdTechConfig) {
        appLogger.log("adTechConfig: \(adTechConfig)")
        switch adTechConfig.placementType {
            case .interstitial:
                IronSource.loadInterstitial()
                
            case .rewardedVideo:
                IronSource.loadRewardedVideo()
                
            case .banner:
                sdkEventsLogger.log("Banner not supported for Ironsource Adapter")

            case .showDebugView:
                appLogger.log("IronSource doesn't have a debug view")
        }
    }
    
    func showInterstitial() -> Bool {
        if IronSource.hasRewardedVideo() {
            IronSource.showRewardedVideo(
                with: delegate.viewController
            )
            return true
        }

        if IronSource.hasInterstitial() {
            IronSource.showInterstitial(
                with: delegate.viewController
            )
            return true
        }

        return false
    }
    
    func destroyInterstitial() {
        // IronSource's interstitials aren't class instances like other SDKs, so we don't
        // need to manually destroy them.
    }
}

// MARK: ISInitializationDelegate
extension VrtcalIronsourceAdaptersWrapper: ISInitializationDelegate {
    func initializationDidComplete() {
        sdkEventsLogger.log("IronSource Initialized")
    }
}

// MARK: ISImpressionDataDelegate
extension VrtcalIronsourceAdaptersWrapper: ISImpressionDataDelegate {
    func impressionDataDidSucceed(_ impressionData: ISImpressionData!) {
        sdkEventsLogger.log("IronSource impressionDataDidSucceed")
    }
}
