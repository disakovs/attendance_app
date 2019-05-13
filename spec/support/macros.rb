def set_admin_user(user=nil)
  session[:user_id] = (user || Fabricate(:user)).id
end

def set_regular_user(user=nil)
  session[:user_id] = (user || User.create(username: 'TeacherUser', password: 'password', role: 'teacher')).id
end

def current_user
  User.find(session[:user_id])
end

def clear_current_user
  session[:user_id] = nil
end
