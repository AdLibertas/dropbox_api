require 'dropbox_api'
require File.expand_path('../../fixtures/dropbox_scaffold_builder', __FILE__)

namespace :test do
  # Example: `rake test:build_scaffold[get_metadata]`
  desc "Regenerates the scaffolding required to test the given endpoint"
  task :build_scaffold, [:endpoint] => [:show_account_warning] do |t, args|
    puts "Regenerating #{args[:endpoint].inspect}"
    DropboxScaffoldBuilder.regenerate args[:endpoint]
  end

  task :show_account_warning do
    print "NOTE: This task will make changes on a real Dropbox account..."
    sleep 5
    puts " ok, going ahead!"
  end
end
