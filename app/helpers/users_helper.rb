module UsersHelper
  def gravatar_for(user, options = {:size => 90})
    gravatar_image_tag(user.email.downcase, :alt => h(user.name),
                                            :class => 'gravatar',
                                            :gravatar => { :default => :mm } )
  end
end
