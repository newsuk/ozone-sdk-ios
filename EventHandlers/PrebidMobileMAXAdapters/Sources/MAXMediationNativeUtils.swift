/*   Copyright 2018-2021 Prebid.org, Inc.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import UIKit
import PrebidMobile
import AppLovinSDK

@objcMembers
public class MAXMediationNativeUtils: NSObject, PrebidMediationDelegate {
    
    public var nativeAdLoader: MANativeAdLoader
    
    private var configIdKey = ""
    private var extrasObjectKey = ""
    
    public init(nativeAdLoader: MANativeAdLoader) {
        self.nativeAdLoader = nativeAdLoader
        super.init()
    }
    
    public func setUpAdObject(configId: String, configIdKey: String,
                              targetingInfo: [String: String], extrasObject: Any?,
                              extrasObjectKey: String) -> Bool {
        self.configIdKey = configIdKey
        self.extrasObjectKey = extrasObjectKey
        
        nativeAdLoader.setLocalExtraParameterForKey(configIdKey, value: configId)
        nativeAdLoader.setLocalExtraParameterForKey(extrasObjectKey, value: extrasObject)
        nativeAdLoader.setLocalExtraParameterForKey(PBMMediationTargetingInfoKey, value: targetingInfo)
        
        return true
    }
    
    public func cleanUpAdObject() {
        nativeAdLoader.setLocalExtraParameterForKey(configIdKey, value: nil)
        nativeAdLoader.setLocalExtraParameterForKey(extrasObjectKey, value: nil)
    }
    
    public func getAdView() -> UIView? {
        return nil
    }
    
}