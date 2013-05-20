class MonsterGroupsController < UIViewController
  attr_reader :per_section

  def viewDidLoad
    super
    @per_section = 20
    @table = UITableView.alloc.initWithFrame(self.view.bounds, style: UITableViewStylePlain)
    self.view.addSubview(@table)
    @table.dataSource = self
    @table.delegate = self
    @monsters = Monster.all.group_by {|monster| row_title(monster.number)}
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @monsters.count
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    @reuse_identifier ||= 'MONSTER_GROUP_CELL_IDENTIFIER'
    cell = table_view.dequeueReusableCellWithIdentifier(@reuse_identifier)
    cell ||= UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @reuse_identifier)
    cell.textLabel.text = @monsters.keys[index_path.row]
    cell
  end

  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    monsters = @monsters.values[index_path.row]
    monsters_controller = MonstersController.alloc.initWithMonsters(monsters)
    self.navigationController.pushViewController(monsters_controller, animated: true)

  end

  def row_title(monster_number)
    start = (monster_number.to_i / (per_section + 1)) * per_section + 1
    "#{start} - #{start + per_section - 1}"
  end

end
