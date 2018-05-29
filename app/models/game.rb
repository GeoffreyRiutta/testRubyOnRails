
class Game < ApplicationRecord

  validates( :name, presence: true)

  before_save :before_save_hook

  private
    def before_save_hook
      self.name = name.capitalize
      self.enemy_name = enemy_name.capitalize
    end

end
