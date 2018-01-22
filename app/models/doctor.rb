class Doctor < ApplicationRecord
  geocoded_by :address
  after_validation  :geocode, if: :address_changed?

  DOCTOR_QUERY_LIMIT = 10

  has_many :comments, dependent: :destroy
  has_many :doctor_specialties, dependent: :destroy
  has_many :specialties, through: :doctor_specialties
  has_many :doctors_related_by_specialties, -> { Doctor.limit(DOCTOR_QUERY_LIMIT) }, class_name: 'Doctor', through: :specialties, source: :doctors

  validates :name, presence: true

  # TODO: Should refactor the sort_by.
  def related_doctors
    Doctor.where(id: related_specialties).limit(5).sort_by { |doctor| doctor.comment_average }.reverse
  end

  # NOTE:
  # This is ineffecient, should refactor.
  # Should add redis caching to save time.
  def nearby_doctors
    self.nearbys.limit(20).collect{|a| a.id}.uniq
  end

  def comment_average
    if self.comments.size > 0
      self.comments.average(:rating)
    else
      'undefined'
    end
  end

  private

  def related_specialties
    related_doctors = doctors_related_by_specialties.pluck(:id) & nearby_doctors
    related_doctors.flatten - [id]
  end
end
