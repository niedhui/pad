class MonsterController < UIViewController
  attr_reader :monster
  stylesheet :monster

  def initWithMonster(monster)
    initWithNibName(nil, bundle: nil).tap do |_self|
      @monster = monster
    end
  end

  layout :root do
    scroll_view = subview(UIScrollView) do
      padding = 10
      last_height = padding
      monster.columns.each do |column|
        puts "last_height #{last_height}"
        attr_label = subview(UILabel, :attr_label)
        attr_label.frame = [[0, last_height], [0, 0]]
        attr_label.text = column.to_s
        attr_label.sizeToFit
        last_height = last_height + attr_label.frame.size.height + padding

        value_label = subview(UILabel, :value_label)
        value_label.frame = [[0, last_height], [0, 0]]
        value_label.text = monster.send(column).to_s
        value_label.sizeToFit
        last_height = last_height + value_label.frame.size.height + padding
      end

    end
    scroll_view.frame = self.view.bounds

  end

end
