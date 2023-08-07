Pod::Spec.new do |s|
  s.name = 'liteAPIClient'
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '3.0'
  s.version = '2.0.0'
  s.source = { :git => 'git@github.com:liteapi-travel/swift-sdk.git', :tag => 'v2.0.0' }
  s.authors = 'liteAPI Generator'
  s.license = 'Proprietary'
  s.homepage = 'https://github.com/liteapi-travel/swift-sdk'
  s.summary = 'liteAPIClient Swift SDK'
  s.source_files = 'LiteAPIClient/Classes/**/*.swift'
  s.dependency 'AnyCodable-FlightSchool', '~> 0.6'
end
