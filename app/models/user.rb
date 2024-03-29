# frozen_string_literal: true

class User < ApplicationRecord
  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
