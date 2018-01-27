class Estudiante < ApplicationRecord
  after_initialize :set_stats
  serialize :data

  def set_stats
    self.seed= rand(1..9999)
    self.exact_mean= rand(1..100)
    self.exact_sigma= rand(1..10)
  end

  def to_csv
    attributes = %w{ n dato }
    index = 0
    CSV.generate(headers: true) do |csv|
      csv << attributes
      self.data.each do |datum|
        csv << [index, datum]
        index+=1
      end
    end
  end



end
