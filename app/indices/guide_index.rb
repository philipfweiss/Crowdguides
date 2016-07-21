ThinkingSphinx::Index.define :guide, :with => :real_time do
  # fields
  indexes title, :sortable => true
  indexes content
  indexes name

  # attributes
  has user_id,  :type => :integer
  has created_at, :type => :timestamp
  has updated_at, :type => :timestamp
end