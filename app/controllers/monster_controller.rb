class MonsterController < UIViewController
  attr_reader :monster

  def initWithMonster(monster)
    initWithNibName(nil, bundle: nil).tap do |_self|
      @monster = monster
    end
  end

  def viewDidLoad
    super
    init_web_view
  end

  def init_web_view
    @web_view = UIWebView.alloc.initWithFrame(self.view.bounds)
    @web_view.autoresizingMask = UIViewAutoresizingFlexibleHeight
    @web_view.delegate = self
    self.view.addSubview(@web_view)
    load_request
  end

  def load_request
    path = NSBundle.mainBundle.pathForResource("html/monster.html",ofType:nil)
    url = NSURL.fileURLWithPath(path)
    request = NSURLRequest.requestWithURL(url)
    @web_view.loadRequest(request)

  end

end
