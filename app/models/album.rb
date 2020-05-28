class Album < ApplicationRecord
  has_many :songs, dependent: :destroy
  validates :name, presence: true
  validates_length_of :name, maximum: 100
  has_many :album_artists
  has_many :artists, :through => :album_artists
  scope :rock, -> { where(genre: "Rock") }
  before_save(:titleize_album)

  private
  def titleize_album
    self.name = self.name.titleize
  end
end