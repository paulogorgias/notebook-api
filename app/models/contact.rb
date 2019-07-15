class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  has_one :address
 accepts_nested_attributes_for :phones, allow_destroy: true
 accepts_nested_attributes_for :address

  def author
    "Paulo Górgias"
    
  end
  def kind_description
    self.kind.description
    
  end

  def as_json(options={})
    hash = super(options)
    hash[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    hash
  end

#  def as_json(options={})
#   super(
#      root: true,
#      methods: [:author, :kind_description], 
#      include: { kind: {only: :description}}
#    )
#    
#  end
end
