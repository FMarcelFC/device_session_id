#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint device_session_id.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'device_session_id'
  s.version          = '1.0.0'
  s.summary          = 'Device Session ID plugin Openpay.'
  s.description      = 'A Flutter plugin for Openpay antifraud system.'
  s.homepage         = 'https://github.com/FMarcelFC/device_session_id'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Freddy Marcel Flors Chavarría' => 'fmarcelfc@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'Openpaykit'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'


end
