metadata :name        => "puppet_env",
         :description => "Triggers updates of puppetserver environments using puppet-env-manager library",
         :author      => "Ben Roberts",
         :license     => "Apache-2.0",
         :version     => "0.1",
         :url         => "https://github.com/optiz0r/puppet-env-manager-agent",
         :timeout     => 900


action "update_all", :description => "Updates all environments" do
  display :always

  input :force,
        :prompt      => "Force",
        :description => "Forces update of modules even if no changes were detected (can be slow)",
        :type        => :boolean,
        :optional    => true

end
