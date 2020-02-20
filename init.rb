plugin_name = :redmine_global_toc

Rails.configuration.to_prepare do
  %w{global_toc}.each do |file_name|
    require_dependency "#{plugin_name}/#{file_name}"
  end
end

Redmine::Plugin.register plugin_name do
  name 'Redmine Global Toc plugin'
  author 'Konstantin Borisov'
  description 'This is a plugin for Redmine with wiki macro that collects all projects available to the user and form the global Redmine Table of Content with links to all wikis for the user.'
  version '0.0.1'
  url 'https://github.com/hitsoft-redmine/redmine_global_toc'
  author_url 'https://github.com/smeagol74'
end
