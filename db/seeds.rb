# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

admin_role = Role.find_or_create_by(code: 'admin', name: 'Admin')
editor_role = Role.find_or_create_by(code: 'editor', name: 'Editor')
author_role = Role.find_or_create_by(code: 'author', name: 'Author')
contributor_role = Role.find_or_create_by(code: 'contributor', name: 'Contributor')

password = 'secret123'

admin = User.find_or_create_by(name: 'Admin', email: 'admin@example.com')
admin.password = password
admin.password_confirmation = password
admin.confirmed_at = Time.now
admin.save

editor = User.find_or_create_by(name: 'Editor', email: 'editor@example.com')
editor.password = password
editor.password_confirmation = password
editor.confirmed_at = Time.now
editor.save

author = User.find_or_create_by(name: 'Author', email:'author@example.com')
author.password = password
author.password_confirmation = password
author.confirmed_at = Time.now
author.save

contributor = User.find_or_create_by(name: 'Contributor', email: 'contributor@example.com')
contributor.password = password
contributor.password_confirmation = password
contributor.confirmed_at = Time.now
contributor.save

guest = User.find_or_create_by(name: 'Guest', email: 'guest@example.com')
guest.password = password
guest.password_confirmation = password
guest.confirmed_at = Time.now
guest.save

admin.roles << admin_role
editor.roles << editor_role
author.roles << author_role
contributor.roles << contributor_role
