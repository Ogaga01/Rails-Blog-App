require 'rails_helper'

RSpec.describe 'Users pages test', type: :feature do
  describe 'index page' do
    before :each do
      @user_first = User.create(name: 'Tom', photo: 'tom.png', bio: 'I am Tom', post_counter: 0)
      @user_second = User.create(name: 'Lilly', photo: 'tom.png', bio: 'A beautiful lady', post_counter: 1)
      @user_third = User.create(name: 'Ogaga', photo: 'tom.png', bio: 'A good guy', post_counter: 2)
    end

    it 'Should display all user names' do
      visit '/'
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
      expect(page).to have_content('Ogaga')
    end

    it 'Should set the link of the picture to the img src' do
      visit '/'
      all('img').each do |i|
        expect(i[:src]).to eq('/assets/tom.png')
      end
    end

    it 'Should display the total post number of users' do
      visit '/'
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content('Number of posts: 1')
      expect(page).to have_content('Number of posts: 2')
    end

    it "Should navigate to user's show page" do
      visit user_path(@user_first.id)
      expect(current_path).to eq(user_path(@user_first.id))
    end
  end

  describe 'show page' do
    before :each do
      @user_first = User.create(name: 'Tom', photo: 'lilly.png', bio: 'A cute lady', post_counter: 0)

      @post_first = @user_first.posts.new(title: 'Niklaus', text: 'This is my first post')
      @post_first.likes_counter = 0
      @post_first.comments_counter = 0
      @post_first.update_users_posts_counter
      @post_first.save

      @post_second = @user_first.posts.new(title: 'Being a good child', text: 'This is my second post')
      @post_second.likes_counter = 0
      @post_second.comments_counter = 0
      @post_second.update_users_posts_counter
      @post_second.save

      @post_third = @user_first.posts.new(title: 'Going to school', text: 'This is my third post')
      @post_third.likes_counter = 0
      @post_third.comments_counter = 0
      @post_third.update_users_posts_counter
      @post_third.save
    end

    it 'Should set the link of the picture to the img src' do
      visit user_path(@user_first.id)
      all('img').each do |i|
        expect(i[:src]).to eq('/assets/lilly.png')
      end
    end

    it 'Should display the user name' do
      visit user_path(@user_first.id)
      expect(page).to have_content('Tom')
    end

    it 'Should display the total post number of 3' do
      visit user_path(@user_first.id)
      expect(page).to have_content('Number of posts: 3')
    end

    it 'Should display user bio' do
      visit user_path(@user_first.id)
      expect(page).to have_content('A cute lady')
    end

    it 'Should display the user first 3 posts' do
      visit user_path(@user_first.id)
      expect(page).to have_content('This is my first post')
      expect(page).to have_content('This is my second post')
      expect(page).to have_content('This is my third post')
    end

    it 'Should display a button with "See all posts" text' do
      visit user_path(@user_first.id)
      expect(page).to have_link('See all posts')
    end

    it 'Should redirect to post page after clicking on "See all posts"' do
      visit user_path(@user_first.id)
      click_link 'See all posts'
      expect(current_path).to eq(user_posts_path(@user_first.id))
    end
  end
end
