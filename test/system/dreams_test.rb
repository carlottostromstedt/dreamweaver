# frozen_string_literal: true

require 'application_system_test_case'

class DreamsTest < ApplicationSystemTestCase
  setup do
    @dream = dreams(:one)
  end

  test 'visiting the index' do
    visit dreams_url
    assert_selector 'h1', text: 'Dreams'
  end

  test 'should create dream' do
    visit dreams_url
    click_on 'New dream'

    fill_in 'Story', with: @dream.story
    click_on 'Create Dream'

    assert_text 'Dream was successfully created'
    click_on 'Back'
  end

  test 'should update Dream' do
    visit dream_url(@dream)
    click_on 'Edit this dream', match: :first

    fill_in 'Story', with: @dream.story
    click_on 'Update Dream'

    assert_text 'Dream was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Dream' do
    visit dream_url(@dream)
    click_on 'Destroy this dream', match: :first

    assert_text 'Dream was successfully destroyed'
  end
end
