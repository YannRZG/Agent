module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :require_authentication
    helper_method :authenticated? if respond_to?(:helper_method)
  end

  class_methods do
    def allow_unauthenticated_access(**options)
      skip_before_action :require_authentication, **options
    end
  end

  private

  def authenticated?
    resume_session
  end

  def require_authentication
    resume_session || request_authentication
  end

  def resume_session
    Current.session ||= find_session_by_cookie
  end

  def find_session_by_cookie
    # Utilise directement cookies.signed pour récupérer le cookie signé
    session_id = cookies.signed[:session_id]
    session = Session.find_by(id: session_id)
    
    # Vérifie si la session existe et est active
    session if session&.active?
  end

  def request_authentication
    respond_to do |format|
      format.html { redirect_to new_session_path }
      format.json { render json: { error: 'Unauthenticated' }, status: :unauthorized }
    end
  end

  def after_authentication_url
    session.delete(:return_to_after_authenticating) || root_url
  end

  def start_new_session_for(user)
    user.sessions.create!(user_agent: request.user_agent, ip_address: request.remote_ip).tap do |session|
      Current.session = session
      cookies.signed.permanent[:session_id] = { 
        value: session.id, httponly: true, secure: Rails.env.production?, same_site: :lax
      }
    end
  end


  def terminate_session
    Current.session.destroy
    cookies.delete(:session_id)
  end
end