# Temporal patch
# https://github.com/thoughtbot/shoulda-matchers/pull/1291
class Symbol
  def in?(collection)
    collection.include?(self)
  end
end