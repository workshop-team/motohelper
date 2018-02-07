# frozen_string_literal: true

module KaminariHelper
  def rel_label(page_next, page_prev)
    label = (page_prev ? 'prev' : nil)
    page_next ? 'next' : label
  end
end
