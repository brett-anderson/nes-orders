# frozen_string_literal: true

module ApplicationHelper
  def status_class
    {
      draft: 'is-warning',
      submitted: 'is-success',
      cancelled: 'is-error'
    }
  end
end
