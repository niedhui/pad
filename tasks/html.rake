require 'slim'

namespace :html do
  desc "generate html file from slim"
  task :generate do
    template_dir = File.expand_path("../../resources/templates", __FILE__)
    html_dir = File.expand_path("../../resources/html", __FILE__)
    Dir.foreach(template_dir) do |file|
      next unless file.end_with?('.slim')
      template = Tilt.new(File.join(template_dir, file))
      File.open(File.join(html_dir, file.sub(/slim/, 'html')), 'w') do |g_file|
        g_file.puts template.render
      end
    end
  end

end
