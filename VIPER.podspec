Pod::Spec.new do |s|
    s.name             = 'VIPER'
    s.version          = '2.0.0'
    s.summary          = 'VIPER interfaces'
    s.description      = <<-DESC
                            Essential interfaces (protocols) for the VIPER architecture.
                       DESC

    s.homepage         = 'https://theswiftdev.com/'
    s.license          = { :type => 'WTFPL', :file => 'LICENSE' }
    s.author           = { 'Tibor Bödecs' => 'mail.tib@gmail.com' }
    s.source           = { :git => 'https://github.com/CoreKit/VIPER.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/tiborbodecs'

    s.ios.deployment_target = '11.0'

    s.swift_version = '5.0'
    s.source_files = 'Sources/**/*'
    s.frameworks = 'Foundation'
end
