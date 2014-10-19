require 'minitest/autorun'
require 'minitest/rg'
require './NBA_info.rb'

describe "Do some test" do
  sam = Scraper.new
  before do
    @game = sam.game
    @profile = sam.profile('chris_bosh')
  end

  it 'will not empty' do
    @profile.wont_be_empty
    @game.wont_be_empty
  end
end
