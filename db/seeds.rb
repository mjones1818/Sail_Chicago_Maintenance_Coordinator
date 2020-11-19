User.all.each {|record| record.destroy}
Sailboat.all.each {|record| record.destroy}
Task.all.each {|record| record.destroy}
UserTask.all.each {|record| record.destroy}


@user1 = User.create(:username => "Mike", :email => "Mike@email.com", :password => "password")
@user2 = User.create(:username => "Marylin", :email => "Marylin@email.com", :password => "password")
@user3 = User.create(:username => "Rich", :email => "Rich@email.com", :password => "password")
@user4 = User.create(:username => "Pat", :email => "Pat@email.com", :password => "password")
@user5 = User.create(:username => "Arleen", :email => "Arleen@email.com", :password => "password")
@user6 = User.create(:username => "Jim", :email => "Jim@email.com", :password => "password")

@boat1 = Sailboat.create(:name => "Albatross", :boat_type => "Colgate")
@boat2 = Sailboat.create(:name => "Recess", :boat_type => "Colgate")
@boat3 = Sailboat.create(:name => "Meridian", :boat_type => "Colgate")
@boat4 = Sailboat.create(:name => "Rubato", :boat_type => "Colgate")
@boat5 = Sailboat.create(:name => "Riverfolk", :boat_type => "Colgate")
@boat6 = Sailboat.create(:name => "Blue Fish", :boat_type => "Rhodes")
@boat7 = Sailboat.create(:name => "Troll", :boat_type => "Ideal")
@boat8 = Sailboat.create(:name => "Priorities", :boat_type => "Cruiser")

@task1 = Task.create(:name => "Scrub the decks", :description => "Use brushes to deep clean the whole boat", :date_completed => "7/12/2020", :sailboat_id => @boat5.id, :procedure => "Barbary Coast rutters. Black jack crack Jennys tea cup. Avast crack Jennys tea cup. Pressgang jack. Bilged on her anchor plunder.")
@task2 = Task.create(:name => "Inspect the sails", :description => "Look at the jib, main and spin sails", :date_due => "7/12/2020", :sailboat_id => @boat3.id)
@task3 = Task.create(:name => "Replace rivets", :description => "replace the rivets", :date_completed => "8/12/2020", :sailboat_id => @boat2.id)
@task4 = Task.create(:name => "inspect the shrouds", :description => "inspect the shrouds", :date_due => "5/12/2021", :sailboat_id => @boat1.id)
@task5 = Task.create(:name => "Fill Gas", :description => "Fill the gas to the top", :date_completed => "7/12/2020", :sailboat_id => @boat1.id)
@task6 = Task.create(:name => "Inventory below deck items", :description => "Inventory below deck items", :date_completed => "7/12/2020", :sailboat_id => @boat4.id)
@task7 = Task.create(:name => "Inventory below deck items", :description => "Inventory below deck items", :date_completed => "7/12/2020", :sailboat_id => @boat7.id)
@task8 = Task.create(:name => "Inventory below deck items", :description => "Inventory below deck items", :date_completed => "7/12/2020", :sailboat_id => @boat8.id)
@task9 = Task.create(:name => "Inventory below deck items", :description => "Inventory below deck items", :date_completed => "7/12/2020", :sailboat_id => @boat6.id)
@task10 = Task.create(:name => "Inventory below deck items", :description => "Inventory below deck items", :date_completed => "7/12/2020", :sailboat_id => @boat6.id)


100.times do |task|
  Task.all.sample.users.push(User.all.sample)
end