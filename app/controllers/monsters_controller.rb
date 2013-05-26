class MonstersController < UIViewController
  attr_reader :monsters

  def initWithMonsters(monsters)
    initWithNibName(nil, bundle: nil).tap do |_self|
      @monsters = monsters
    end
  end

  def viewDidLoad
    super
    @table = UITableView.alloc.initWithFrame(self.view.bounds, style: UITableViewStylePlain)
    self.view.addSubview(@table)
    @table.dataSource = self
    @table.delegate = self
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight
  end

  def tableView(table_view, numberOfRowsInSection: section)
    monsters.count
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    @reuse_identifier ||= 'MONSTER_CELL_IDENTIFIER'
    cell = table_view.dequeueReusableCellWithIdentifier(@reuse_identifier)
    cell ||= UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @reuse_identifier)
    monster = monsters[index_path.row]
    cell.textLabel.text = monster.name
    avatar = UIImage.imageNamed("monster_images/#{monster.number}/avatar40.png")
    cell.imageView.image = avatar
    cell
  end

  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    monster = monsters[index_path.row]
    monster_controller = MonsterController.alloc.initWithMonster(monster)
    self.navigationController.pushViewController(monster_controller, animated: true)
  end

end
