require_relative 'action_mixins/change_stats_mixin'

class Sleep
  include ChangeStatsMixin
  attr_accessor :base_object, :stats

  def initialize(base_object)
    @base_object = base_object
  end

  def stats!
    @stats = @base_object.stats!.clone

    @stats['health'] = take_op 'health', '+', 90
    @stats['fun'] = take_op 'fun', '-', 3
    @stats['mana'] = take_op 'mana', '-', 50
    @stats['fatigue'] = take_op 'fatigue', '-', 70

    @stats
  end

  def self.perhaps?(current_stats)
    current_stats['state?']['7'] = true
  end

  def self.print_info(numb, stats)
    puts "#{numb}: Sleep" + (perhaps?(stats) ? '' : ' (can\'t)')
  end
end
