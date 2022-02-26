#
#platform :ios, '10.0'
#
#target 'Coder_new' do
#
#  use_frameworks!
#
#pod 'GXComboBox'
#
#end


platform :ios, '10.0'
target 'Coder_new' do

use_frameworks!

pod "PagingMenuController"

post_install do |installer|
 installer.pods_project.targets.each do |target|
   target.build_configurations.each do |config|
     config.build_settings['SWIFT_VERSION'] = '5.4'
   end
 end
end

pod  'AlipaySDK-iOS'

end
