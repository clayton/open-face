class AIPlayer
  def initialize
    @top = []
    @middle = []
    @bottom = []
  end

  def hand
    [@top, @middle, @bottom]
  end

  def put_in_bottom?(card)
    return false if @bottom.count >= 5
    value_of(card) > 9
  end

  def start(initial_hand)
    initial_hand.each do |card|
      take card
    end
  end

  def take(card)
    if put_in_bottom? card
      @bottom << card
    end
    # elsif put_in_middle?
    #   @middle << card
    # else
    #   @bottom << card
    # end
  end

  def value_of(card)
    value = card[0..-2]
    return value.to_i if value[/^[0-9]+$/]

    case value
    when 'J' then 11
    when 'Q' then 12
    when 'K' then 13
    when 'A' then 14
    end
  end
end