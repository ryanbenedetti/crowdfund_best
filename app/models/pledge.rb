class Pledge < ActiveRecord::Base
  
  validates :name, :email, presence: true
  
  validates :email, format: {with: /(\S+)@(\S)/}
  
  validates :amount, numericality: { greater_than: 0 }
  
  belongs_to :project
  
end
