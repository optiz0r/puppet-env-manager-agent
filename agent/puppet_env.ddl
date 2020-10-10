metadata :name        => "puppet_env",
         :description => "Triggers updates of puppetserver environments using puppet-env-manager library",
         :author      => "Ben Roberts",
         :license     => "Apache-2.0",
         :version     => "0.2.0",
         :url         => "https://github.com/optiz0r/puppet-env-manager-agent",
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
         :display_as  => "Added"

  output :failed,
         :description => "List of environments failed",
         :display_as  => "Failed"

  output :removed,
         :description => "List of environments removed",
         :display_as  => "Removed"

  output :unchanged,
         :description => "List of environments unchanged",
         :display_as  => "Unchanged"

  output :updated,
         :description => "List of environments updated",
         :display_as  => "Updated"

end

action "update", :description => "Updates the given environment" do
  display :always

  input :environment,
        :prompt      => "Environment Name",
        :description => "Name of the environment to update",
        :type        => :string,
        :validation  => '^[a-zA-Z][a-zA-Z0-9_]+$',
        :maxlength   => 64,
        :optional    => false


  input :force,
        :prompt      => "Force",
        :description => "Forces update of modules even if no changes were detected (can be slow)",
        :type        => :boolean,
        :optional    => true




end

