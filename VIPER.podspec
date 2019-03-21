Pod::Spec.new do |s|
    s.name             = 'VIPER'
    s.version          = '1.0.2'
    s.summary          = 'VIPER protocols'
    s.description      = <<-DESC
                            Essential protocols for the VIPER architecture.
                       DESC

    s.homepage         = 'https://theswiftdev.com/'
    s.license          = { :type => 'WTFPL', :file => 'LICENSE' }
    s.author           = { 'Tibor Bödecs' => 'mail.tib@gmail.com' }
    s.source           = { :git => 'https://github.com/CoreKit/VIPER.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/tiborbodecs'

    s.ios.deployment_target = '11.0'

    s.swift_version = '4.2'
    s.source_files = 'Sources/**/*'
    s.frameworks = 'UIKit'
end
