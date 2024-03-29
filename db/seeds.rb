# frozen_string_literal: true

account = Account.create!
User.create!(email: 'user@test.com', password: 'user@test.com', account: account)

group1 = account.groups.create!(position: 1, name: 'List A')
group2 = account.groups.create!(position: 2, name: 'List B')
group3 = account.groups.create!(position: 3,
                                name: 'Group with a long long long long long long long long long long name')

account.items.create!(group: group1, position: 1, name: 'Item A')
account.items.create!(group: group1, position: 2, name: 'Item Z', total: 1, confirmed: true)
account.items.create!(group: group1, position: 3, name: 'Item H', total: 5, confirmed: true)
account.items.create!(group: group1, position: 4, name: 'Item E')
account.items.create!(group: group1, position: 5, name: 'Item K', total: 2)
account.items.create!(group: group1, temporary: true, position: 6, name: 'Temp M', total: 1, confirmed: true)
account.items.create!(group: group1, temporary: true, position: 7, name: 'Temp C')

account.items.create!(group: group2, position: 1, name: 'Item L', total: 10, confirmed: true)
account.items.create!(group: group2, position: 2, name: 'Item D', total: 2)
account.items.create!(group: group2, position: 3, name: 'Item P')
account.items.create!(group: group2, temporary: true, position: 4, name: 'Temp I', total: 2, later: true)

account.items.create!(group: group3, position: 1, name: 'Item T')
account.items.create!(group: group3, position: 2, name: 'Item E')
