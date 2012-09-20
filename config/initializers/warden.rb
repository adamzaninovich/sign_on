Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = lambda { |env| SessionsController.action(:new).call(env) }
end

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.find(id)
end

Warden::Strategies.add(:password) do
  def valid?
    params['email'] && params['password']
  end
  
  def authenticate!
    user = User.find_by_email(params['email'])
    if user && user.authenticate(params['password'])
      success! user
    else
      fail I18n.t 'auth.failure'
    end
  end
end

# Warden::Strategies.add(:from_session) do
#   def valid?
#     # this strategy is only valid if there is a url_token in the params hash
#     params['url_token']
#   end
#   
#   def authenticate!
#     # lookup session data with external api
#     session_data = get_session_data_from_api(params['url_token'])
#     # check if token was valid and authorize if so
#     if session_data['error']
#       # session lookup failed so fail authentication with message from api
#       fail!(session_data['error'])
#     else
#       # we got some valid user data
#       success!(User.find(session_data['user_id']))
#   end
# end