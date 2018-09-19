
Pod::Spec.new do |s|

  s.name         = "RRRCategory"
  s.version      = "0.1.2"
  s.summary      = "个人使用的Category"

  s.description  = <<-DESC
                个人整理的常用Category
                DESC

  s.homepage     = "https://github.com/RRRenJ/RRRCategory"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "RRRenJ" => "https://github.com/RRRenJ" }

  s.source       = { :git => "https://github.com/RRRenJ/RRRCategory.git", :tag => s.version }

  s.public_header_files = "RRRCategory/RRRCategory.h"

  s.source_files  = "RRRCategory/RRRCategory.h"

  s.requires_arc = true

  s.frameworks   = 'UIKit', "Foundation"

  s.platform     = :ios, "8.0"


  s.subspec 'UI' do |ss|

  ss.source_files = 'RRRCategory/UI/*.{h,m}'

  end

  s.subspec 'NS' do |ss|

  ss.source_files = 'RRRCategory/NS/*.{h,m}'

  end










end
