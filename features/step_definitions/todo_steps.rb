Given("there two users with todos, Panks and Tom") do

    @panks = User.create(email: "panks@example.com", password:"testing123")
    @panks_todo1=Item.create(task: "Take out the trash")

    @tom=User.create(email: "tom@example.com", password: "testing123")
    @tom_todo1=Item.create(task: "Clean my room")
    @tom_todo2=Item.create(task: "Workout")
end 


Given("I sign in as Panks") do

    visit new_user_session_path
    fill_in "user_emaiWl", with: @panks.email
    fill_in "user_password", with: "testing123"
    click_on "Log in"
end 

When("I visit the homepage") do

    visit root_path

end 

Then("I should only see Panks's Post") do

    @todos=@panks.items
    @todos.each do |t|
        expect(page).to have_text(t.title)

    end 
    expect(page).to have_text("Edit", count: @todos.count)
end 