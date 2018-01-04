#
# Be sure to run `pod lib lint HaiGCDTimerPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

#=====  名称、版本号、摘要=====

s.name            = 'HaiGCDTimerPod'

s.version          = '1.0.0'

s.summary          ='summary HaiGCDTimerPod'

#===== 详情  =====

s.description      = <<-DESC
TODO: Add long description of the pod here.
DESC

#=====  仓库主页（你github或者其它git管理平台中，你这个项目对应的地址）  =====

s.homepage        = 'https://github.com/diankuanghuolong/GCDTimerDemo'

#=====  许可  =====

s.license          = { :type => 'MIT', :file => 'LICENSE' }

#=====  作者  =====

s.author          = { 'diankuanghuolong' => '3243388139@qq.com' }

#=====  仓库源  =====

s.source          = { :git => 'https://github.com/diankuanghuolong/GCDTimerDemo.git', :tag => "#{s.version}" }

s.ios.deployment_target = '8.0'

#===== 源文件目录  =====

s.source_files = 'HaiGCDTimerPod/Classes/**/*'


# s.resource_bundles = {

#  'HaiGCDTimerPod' => ['HaiGCDTimerPod/Assets/*.png']

# }

# s.public_header_files = 'Pod/Classes/**/*.h'

# s.frameworks = 'UIKit', 'MapKit'

# s.dependency 'AFNetworking', '~> 2.3'

end
