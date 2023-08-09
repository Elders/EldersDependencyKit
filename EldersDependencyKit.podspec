Pod::Spec.new do |s|
  s.name             = 'EldersDependencyKit'
  s.version          = '0.3.0'
  s.summary          = 'Lightweight dependency injection library written in Swift.'
 
  s.description      = <<-DESC
Lightweight dependency injection library written in Swift, relying on property wrapper(s).
                       DESC
 
  s.homepage         = 'https://github.com/Elders/EldersDependencyKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Elders OSS' => 'r2d2@eldersoss.com' }
  s.source           = { :git => 'https://github.com/Elders/EldersDependencyKit.git', :tag => "#{s.version}" }
 
  s.swift_version = "5.7"
  s.ios.deployment_target = "11.0"

  s.source_files  = "#{s.name}/**/*.swift", "#{s.name}/**/*.{h,m}"
 
end