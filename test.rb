require 'minitest/autorun'
require 'minitest/rg'
require './NBA_info.rb'

describe 'Do some test' do
  sam = Scraper.new
  before do
    @game = sam.game
    @profile = sam.profile('chris_bosh')
  end

  it 'will not empty' do
    @profile[0].wont_be_empty
    @game[0].wont_be_empty
  end

  it 'will be number' do
    @profile[1][1].must_be_kind_of String
  end

  it 'size will be 4' do
    @profile[1].size.must_equal 4
  end
end
