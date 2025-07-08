class Contact < ApplicationRecord
  include PgSearch::Model

  validates_presence_of :name
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

   pg_search_scope :fuzzy_search, 
    against: [:name, :email],
    using: {
      tsearch: { prefix: true, any_word: true }
    }

  pg_search_scope :search_by_name, against: :name,
                  using: {
                  tsearch: { prefix: true },
                  trigram: { threshold: 0.3 }
                }
  pg_search_scope :search_by_email, against: :email,
                using: {
                  tsearch: { prefix: true },
                  trigram: { threshold: 0.3 }
                }

  def self.search_contacts(query)
    query = query.to_s.strip
    
    return all if query.blank?
        begin
      fuzzy_search(query)
    rescue => e
      Rails.logger.error "Search error: #{e.message}"
      # Fallback to basic search if fuzzy search fails
      where("name ILIKE ? OR email ILIKE ?", "%#{query}%", "%#{query}%")
    end
  end
end
