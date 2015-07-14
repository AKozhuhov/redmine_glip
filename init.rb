Redmine::Plugin.register :redmine_glip do
  name 'Glip'
  author ''
  description 'Sends notifications to a Glip room.'
  version '2.0.0'
  url ''
  author_url ''

  Rails.configuration.to_prepare do
    require_dependency 'hipchat_hooks'
    require_dependency 'hipchat_view_hooks'
    require_dependency 'project_patch'
    Project.send(:include, RedmineHipchat::Patches::ProjectPatch)
  end

  settings :partial => 'settings/redmine_glip',
    :default => {
      :room_id => "",
      :auth_token => "",
    }
end
