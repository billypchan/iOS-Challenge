# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'Coon' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  use_frameworks!

  # Pods for Coon
  pod 'FlickrKit'
  pod 'AFNetworking'

pod 'SDWebImage' ###FIXME: AFNetworking with img cache?
pod 'PKHUD', :git => 'https://github.com/pkluz/PKHUD.git', :branch => 'release/swift4'

pod 'OHHTTPStubs/Swift' # includes the Default subspec, with support for NSURLSession & JSON, and the Swiftier API wrappers


  target 'CoonTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
