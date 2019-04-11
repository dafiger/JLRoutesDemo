# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'RouteDemo' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for RouteDemo
  pod 'JLRoutes'

end

# 实现post_install Hooks
post_install do |installer|
# puts 为在终端打印方法
puts "##### post_install start #####"

  # 1. 遍历项目中所有target
  installer.pods_project.targets.each do |target|
    # 2. 遍历build_configurations
    target.build_configurations.each do |config|
      # 3. 修改build_settings中的ENABLE_BITCODE
      config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
  end
    
puts "##### post_install end #####"
end