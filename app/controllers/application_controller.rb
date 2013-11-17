class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User)
        if resource.admin?
          admin_url
        elsif resource.editor?
          editor_url
        elsif resource.author?
          author_url
        elsif resource.contributor?
          contributor_url
        else
          super
        end
      else
        super
      end
  end
end
