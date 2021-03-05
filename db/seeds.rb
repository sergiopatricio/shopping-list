# frozen_string_literal: true

user = User.create!(email: 'user@test.com', password: 'user@test.com')

group1 = user.groups.create!(position: 1, name: 'List A')
group2 = user.groups.create!(position: 2, name: 'List B')
group3 = user.groups.create!(position: 3, name: 'Group with a long long long long long long long long long long name')

user.items.create!(group: group1, position: 1, name: 'Item A')
user.items.create!(group: group1, position: 2, name: 'Item Z', total: 1, confirmed: true)
user.items.create!(group: group1, position: 3, name: 'Item H', total: 5, confirmed: true)
user.items.create!(group: group1, position: 4, name: 'Item E')
user.items.create!(group: group1, position: 5, name: 'Item K', total: 2)
user.items.create!(group: group1, temporary: true, position: 6, name: 'Temp M', total: 1, confirmed: true)
user.items.create!(group: group1, temporary: true, position: 7, name: 'Temp C')

user.items.create!(group: group2, position: 1, name: 'Item L', total: 10, confirmed: true)
user.items.create!(group: group2, position: 2, name: 'Item D', total: 2)
user.items.create!(group: group2, position: 3, name: 'Item P')
user.items.create!(group: group2, temporary: true, position: 4, name: 'Temp I', total: 2)

user.items.create!(group: group3, position: 1, name: 'Item T')
user.items.create!(group: group3, position: 2, name: 'Item E')
