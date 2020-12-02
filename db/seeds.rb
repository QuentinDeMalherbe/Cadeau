# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
famille = Famille.create(nom: 'Malherbe');
famille.save

user1  = User.create( first_name: 'Alban', participant: false, famille: famille, selectionne: false, a_selectionne: false)
user2  = User.create( first_name: 'Nathalie', participant: false,  famille: famille, selectionne: false, a_selectionne: false)
user3  = User.create( first_name: 'Gonzague', participant: true,  famille: famille , selectionne: true, a_selectionne: true, give_to_user: 7, recieve_from_user: 6 )
user4  = User.create( first_name: 'Aurélie', participant: true,  famille: famille, selectionne: true, a_selectionne: true, give_to_user: 6, recieve_from_user: 9)
user5 = User.create( first_name: 'Axel', participant: true,  famille: famille, selectionne: true, a_selectionne: true, give_to_user: 9, recieve_from_user: 7)
user6  = User.create( first_name: 'Valérie', participant: true,  famille: famille, selectionne: true, a_selectionne: true, give_to_user: 3, recieve_from_user:  4)
user7  = User.create( first_name: 'Clotilde',  participant: true, famille: famille, selectionne: true, a_selectionne: true, give_to_user: 5, recieve_from_user:  3)
user8  = User.create( first_name: 'Quentin', participant: true,  famille: famille, selectionne: true, a_selectionne: true, give_to_user: 10, recieve_from_user:  10)
user9  = User.create( first_name: 'Raphaël', participant: true,  famille: famille, selectionne: true, a_selectionne: true, give_to_user: 4, recieve_from_user:  5)
user10  = User.create( first_name: 'Ching', participant: true,  famille: famille, selectionne: true, a_selectionne: true, give_to_user: 8, recieve_from_user:  8)
user1.save
user2.save
user3.save
user4.save
user5.save
user6.save
user7.save
user8.save
user9.save
user10.save
