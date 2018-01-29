# frozen_string_literal: true

module Admin
  class RemindersController < Admin::ApplicationController
    # Define a custom finder by overriding the `find_resource` method:
    def find_resource(param)
      Reminder.friendly.find(param)
    end
  end
end
