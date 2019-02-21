class CreateDetailReports < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_reports do |t|

      t.timestamps
    end
  end
end
