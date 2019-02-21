class DetailReport < ApplicationRecord

  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |data|
      csv << data.attributes
    end
  end
end
end
