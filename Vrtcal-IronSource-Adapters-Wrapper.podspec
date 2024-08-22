Pod::Spec.new do |s|
    s.name         = "Vrtcal-IronSource-Adapters-Wrapper"
    s.version      = "1.0.0"
    s.summary      = "Wrapper for Vrtcal-IronSource-Adapters"
    s.homepage     = "http://vrtcal.com"
    s.license = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2020 Vrtcal Markets, Inc.
                  LICENSE
                }
    s.author       = { "Scott McCoy" => "scott.mccoy@vrtcal.com" }
    
    s.source       = { :git => "https://github.com/vrtcalsdkdev/Vrtcal-IronSource-Adapters-Wrapper.git", :tag => "#{s.version}" }
    s.source_files = "*.swift"

    s.platform = :ios
    s.ios.deployment_target  = '12.0'

    s.dependency 'Vrtcal-Adapters-Wrapper-Parent'
    s.dependency 'Vrtcal-IronSource-Adapters'

    s.static_framework = true
end
