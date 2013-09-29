Pod::Spec.new do |s|
  s.name     = 'iVerify'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'Verify provides simple tests for checking user inputs in a variety of interface objects.'
  s.homepage = 'https://github.com/atomos86/iVerify'
  s.authors  = {'Brian Thomas' => 'brian@wideeyelabs.com'}
  s.source   = { :git => 'https://github.com/atomos86/iVerify.git', :tag => '1.0.0'}
  s.source_files = 'iVerify'
  s.requires_arc = true

  s.ios.deployment_target = '7.0'
end
