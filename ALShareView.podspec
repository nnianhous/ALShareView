Pod::Spec.new do |s|
  s.name         = 'ALShareView'
  s.summary      = 'ALShareView framework.'
  s.version      = '0.0.1'
  s.license      = { :type => 'MIT', :file => 'FILE_LICENSE' }
  s.authors      = { 'fpli' => '952241861@qq.com' }
  s.homepage     = 'https://github.com/nnianhous/ALShareView'
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/nnianhous/ALShareView.git", :tag => "#{s.version}" }
  
  s.requires_arc = true
  s.source_files = 'ALShareView/ALShareView/**/*.{swift}'

end