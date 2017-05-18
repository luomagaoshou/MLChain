#
#  Be sure to run `pod spec lint MLChain.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "MLChain"
  s.version      = "1.0.2"
  s.summary      = "chain program"

  s.homepage     = "https://github.com/luomagaoshou/MLChain"


  s.license      = "MIT"
    s.platform     = :ios, "7.0"

  s.author        = { "luomagaoshou" => "" }


  s.source       = { :git => "https://github.com/luomagaoshou/MLChain.git", :tag =>s.version }

    s.requires_arc     = true
  s.source_files  = "MLChain", "MLChain/**/*.{h,m}"
#s.exclude_files = "Classes/Exclude"

end
