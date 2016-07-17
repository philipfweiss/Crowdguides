class AddIssueTypeToTidbits < ActiveRecord::Migration
  def change
    add_column :tidbits, :issue_type, :string
  end
end
