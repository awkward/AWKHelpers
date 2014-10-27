
Pod::Spec.new do |s|
  s.name             = "AWKHelpers"
  s.version          = "0.2"
  s.summary          = "A growing collection of UIKit and Foundation categories (helpers)"
  s.description      = <<-DESC
                       A growing collection of UIKit and Foundation categories (helpers). Support includes: 
- NSDictionary
- NSArray
- NSString
- UIDevice
- UIColor
                       DESC
  s.homepage         = "https://github.com/awkward/AWKHelpers"
  s.license          = 'MIT'
  s.author           = { "Awkward" => "office@madeakward.com" }
  s.source           = { :git => "https://github.com/awkward/AWKHelpers.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/madeawkward'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Classes'

  s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'UIKit', 'HealthKit', 'Foundation', 'security'
end
