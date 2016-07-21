ThinkingSphinx::Index.define :guide, :with => :real_time do
  # fields
  indexes title, :sortable => true
  indexes content, :sortable => true

  # attributes
  has title, :type => :text
  has content, :type => :text
  has user_id,  :type => :integer
  has created_at, :type => :timestamp
  has updated_at, :type => :timestamp
end