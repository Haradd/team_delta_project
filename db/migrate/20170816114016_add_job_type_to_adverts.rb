class AddJobTypeToAdverts < ActiveRecord::Migration[5.1]
  def change
    add_column :adverts, :job_type, :string
  end
end
