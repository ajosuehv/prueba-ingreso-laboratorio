class Estudiante < ApplicationRecord
  after_initialize  :set_stats, if: :new_record?
  serialize :data

  def set_stats
    self.seed = rand(1.0..9999.0).round(4)
    self.exact_mean = rand(1.0..1000.0).round(4)
    self.exact_sigma = rand(2.5..10.0).round(4)
  end

  def to_csv
    attributes = %w{ n dato }
    index = 0
    CSV.generate(headers: true) do |csv|
      csv << attributes
      self.data.each do |datum|
        csv << [index, datum]
        index += 1
      end
    end
  end
end
