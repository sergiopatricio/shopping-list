# Shopping list app
This is a simple application to manage a shopping list with the usual things to buy.

## Account
Represents a shopping list account, and can be shared with multiple users (although each user can only be in one 
account).

## Users
There's no registration process. Users need to be created manually:

    account = Account.create!
    User.create!(email: '[email]', password: '[password]]', account: account)

When logged in, users can change their email and password on the user details page.

Registration and password recovery are not implemented at the moment.

## Groups & items
Groups are used to organise items. They can be a section of the house (bathroom, kitchen, etc.), separate lists (home,
work, etc.), or any other grouping preference.

## Shopping list
Shows all items organised by group and allows quantities to be updated.
Regular items are always there. Temporary items can be added and will be removed if the list is cleared.

The purpose of the shopping list is to update quantities of the needed items.

## Confirmation
Confirmation only shows the items with a quantity bigger than zero.
Items can be sorted by group or name.

The purpose of confirmation is to confirm items when the purchase is being made and they are added to a physical or
online shopping cart.

## Technical stuff
This is a rails app, using PostgreSQL for the database, Devise for authentication and bootstrap for the layout.
