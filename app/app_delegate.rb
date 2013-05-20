class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    read_json if Monster.count == 0
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    monsters_controller = MonsterGroupsController.alloc.initWithNibName(nil, bundle: nil)
    nav_controller = UINavigationController.alloc.initWithRootViewController(monsters_controller)
    @window.rootViewController = nav_controller
    @window.makeKeyAndVisible
    true
  end

  def read_json
    path = NSBundle.mainBundle.pathForResource("monsters.json", ofType: nil)
    content = NSString.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: nil)
    json_array = BW::JSON.parse(content.strip)
    json_array.each do |monser_json|
      Monster.create(monser_json)
    end
  end
end
