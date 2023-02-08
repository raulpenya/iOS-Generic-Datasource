Pod::Spec.new do |s|
  s.name             = 'iOS-Generic-Datasource'
  s.version          = '0.1.0'
  s.summary          = 'Light weight generic datasource that fits in every project.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
                   
  s.homepage         = 'https://github.com/raulpenya/iOS-Generic-Datasource'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'raulpenya' => 'rpenya.mail@gmail.com' }
  s.source           = { :git => 'https://github.com/raulpenya/iOS-Generic-Datasource.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'

  s.source_files = 'iOS-Generic-Datasource/Module/**/*.{swift}'

  s.resources = 'iOS-Generic-Datasource/Module/**/*.{xcassets,json,storyboard,xib,xcdatamodeld}'
  
end
