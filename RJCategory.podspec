
Pod::Spec.new do |s|

  s.name         = "RJCategory"
  s.version      = "0.0.1"
  s.summary      = "个人使用的Category"

  s.description  = <<-DESC
                个人整理的常用Category
                DESC

  s.homepage     = "https://github.com/RRRenJ/RJCategory"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "RRRenJ" => "https://github.com/RRRenJ" }

  s.source       = { :git => "https://github.com/RRRenJ/RJCategory.git", :tag => s.version }

  s.source_files  = "RJCategory/RJCategory/*.{h,m}"

  s.requires_arc = true

  s.frameworks   = 'UIKit', "Foundation"

  s.platform     = :ios, "8.0"

end
