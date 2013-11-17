# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

admin_role = Role.find_or_create_by(code: 'admin', name: 'Admin')
editor_role = Role.find_or_create_by(code: 'editor', name: 'Editor')
author_role = Role.find_or_create_by(code: 'author', name: 'Author')
contributor_role = Role.find_or_create_by(code: 'contributor', name: 'Contributor')

password = 'secret123'

User.destroy_all

admin = User.new(name: 'Admin', email: 'admin@example.com', password: password, password_confirmation: password, confirmed_at: Time.now)
admin.skip_confirmation!
admin.save

editor = User.new(name: 'Editor', email: 'editor@example.com', password: password, password_confirmation: password, confirmed_at: Time.now)
admin.skip_confirmation!
editor.save

author = User.new(name: 'Author', email:'author@example.com', password: password, password_confirmation: password, confirmed_at: Time.now)
admin.skip_confirmation!
author.save

contributor = User.new(name: 'Contributor', email: 'contributor@example.com', password: password, password_confirmation: password, confirmed_at: Time.now)
admin.skip_confirmation!
contributor.save

guest = User.new(name: 'Guest', email: 'guest@example.com', password: password, password_confirmation: password, confirmed_at: Time.now)
admin.skip_confirmation!
guest.save

admin.roles << admin_role
editor.roles << editor_role
author.roles << author_role
contributor.roles << contributor_role
