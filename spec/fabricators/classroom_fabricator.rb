Fabricator(:classroom) do
  name { Faker::Lorem.words(1) }
  age_limit { "2-3" }
  classroom_type { "gymnastics" }
end

# Fabricator(:classroom) do
#   name { Faker::Lorem.words(1) }
#   age_limit { "2-3" }
#   classroom_type { "gymnastics" }
# end
# 
# Fabricator(:classroom) do
#   name { Faker::Lorem.words(1) }
#   age_limit { "2-3" }
#   classroom_type { "parkour" }
# end