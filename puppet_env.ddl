metadata :name        => "puppet_env",
         :description => "Triggers updates of puppetserver environments using puppet-env-manager library",
         :author      => "Ben Roberts",
         :license     => "Apache-2.0",
         :version     => "0.1",
         :url         => "https://github.com/optiz0r/puppet-env-agent",
         :provider    => "external",
         :timeout     => 900


action "update_all", :description => "Updates all environments" do
  display :always

  input :force,
        :prompt      => "Force",
        :description => "Forces update of modules even if no changes were detected (can be slow)",
        :type        => :boolean,
        :optional    => true




  output :added,
         :description => "List of environments added",
         :display_as  => "Added",
         :type        => ""

  output :failed,
         :description => "List of environments failed",
         :display_as  => "Failed",
         :type        => ""

  output :removed,
         :description => "List of environments removed",
         :display_as  => "Removed",
         :type        => ""

  output :unchanged,
         :description => "List of environments unchanged",
         :display_as  => "Unchanged",
         :type        => ""

  output :updated,
         :description => "List of environments updated",
         :display_as  => "Updated",
         :type        => ""

end

