desc "Clean build directory"
task :clean do
  system_do "rm -rf #{build_dir}/*"
end

desc "Bump project build number"
task :increment_build do
  system_do "agvtool bump -all"
end

desc "Pull changes from origin master"
task :pull do
  system_do "git pull --rebase origin master"
end

desc "Run all specs"
task :specs do
  # TBI
end

desc "Push changes to origin master"
task :push do
  system_do "git push origin master"
end

desc "Integrate local changes"
task :integrate => [:pull, :specs, :push]

namespace :prepare do
  desc "Prepare Xcode Integrations for Pawn"
  task :xcode do
    puts "Preparing Xcode Integration ..."
    system_do %Q^rm -rf "#{xcode_build_dir}"^
    templates_build_dir = File.join(xcode_build_dir, "Templates")
    system_do %Q^mkdir -p "#{templates_build_dir}"^

    file_template_sources_dir = File.join(
      sources_dir,
      "Xcode Integration",
      "File Templates")
    system_do %Q^cp -R "#{file_template_sources_dir}" "#{templates_build_dir}"^

    project_template_sources_dir = File.join(
      sources_dir,
      "Xcode Integration",
      "Project Templates")
    system_do %Q^cp -R "#{project_template_sources_dir}" "#{templates_build_dir}"^
  end
end

namespace :install do
  desc "Install Xcode Integrations for Pawn"
  task :xcode => ["uninstall:xcode", "prepare:xcode"] do
    puts "Installing Xcode Integration ..."
    system_do %Q^ditto "#{xcode_build_dir}" "#{Dir.home}/Library/Developer/Xcode/"^
  end
end

namespace :uninstall do
  desc "Remove Xcode Integrations"
  task :xcode do
    puts "Uninstalling Xcode Integration ..."

    xcode_templates_dir = "#{Dir.home}/Library/Developer/Xcode/Templates"
#    xcode_snippets_dir = "#{Dir.home}/Library/Developer/Xcode/UserData/CodeSnippets"

    system_do %Q^rm -rf "#{xcode_templates_dir}/File Templates/Pawn"^
    system_do %Q^rm -rf "#{xcode_templates_dir}/Project Templates/Pawn"^
#    system_do %Q^grep -Rl "#{SNIPPET_SENTINEL_VALUE}" "#{XCODE_SNIPPETS_DIR}" | xargs -I{} rm -f "{}"^
  end
end


#
#  Helper functions
#

def system_do(command)
  puts "$ #{command}"
  system(command) or raise ">>>>>>> Command failed"
end

def project_dir
  File.dirname(__FILE__)
end

def sources_dir
  File.join(project_dir, "Sources")
end

def build_dir
  build_dir = File.join(project_dir, "build")
  Dir.mkdir(build_dir) unless File.exists?(build_dir)
  build_dir
end

def xcode_build_dir
  File.join(build_dir, "Xcode Integration")
end
