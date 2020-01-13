Warden::Manager.after_set_user do |user,auth,opts|
  scope = opts[:scope]
  auth.cookies.signed["#{scope}.id"] = user.id
end

Warden::Manager.before_logout do |user, auth, opts|
  scope = opts[:scope]
  auth.cookies.signed["#{scope}.id"] = nil
end

# after_set_user is a callback hook set to run every time after a user is set. this callback is triggered the first time one of those three events happens during a request: :authentication, :fetch and :set_user. you can supply as many hooks as you like and they will be run in order of declaration.

