Pod::Spec.new do |s|
  s.name             = "NFolioReaderKit"
  s.version          = "2.0.0"
  s.summary          = "A Swift ePub reader and parser framework for iOS."
  s.description  = <<-DESC
                   Written in Swift.
                   The Best Open Source ePub Reader.
                   DESC
  s.homepage         = "https://github.com/bmcalister/FolioReaderKit"
  s.screenshots     = "https://raw.githubusercontent.com/FolioReader/FolioReaderKit/assets/custom-fonts.gif", "https://raw.githubusercontent.com/FolioReader/FolioReaderKit/assets/highlight.gif"
  s.license          = 'BSD'
  s.author           = { "Heberti Almeida" => "hebertialmeida@gmail.com" }
  s.source           = { :git => "https://github.com/bmcalister/FolioReaderKit.git", :tag => s.version.to_s }

  s.swift_version = '4.2'
  s.platform      = :ios, '10.0'
  s.requires_arc  = true
  s.ios.deployment_target  = '10.0'
  s.source_files = [
    'Source/*.{h,swift}',
    'Source/**/*.swift',
    'Vendor/**/*.swift',
  ]
  s.resources = [
    'Source/**/*.{js,css}',
    'Source/Resources/*.xcassets',
    'Source/Resources/Fonts/**/*.{otf,ttf}'
  ]
  s.public_header_files = 'Source/*.h'
  s.pod_target_xcconfig = {
    'PRODUCT_BUNDLE_IDENTIFIER': 'io.mca.nfolioreaderkit'
  } 
  s.libraries  = "z"
  s.dependency 'SSZipArchive', '2.2.3'
  s.dependency 'MenuItemKit', '3.1.3'
  s.dependency 'ZFDragableModalTransition', '0.6'
  s.dependency 'AEXML', '4.3.3'
  s.dependency 'FontBlaster', '4.1.0'
  s.dependency 'RealmSwift', '10.5.1'
  s.dependency 'Realm', '10.5.1'

end
