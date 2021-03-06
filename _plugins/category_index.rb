module Jekyll
  class CategoryIndex < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'categories.html')
      self.data['category'] = category
      self.data['title'] = "#{category.upcase}"
    end
  end

  class CategoryGenerator < Generator
    safe true
    priority :low

    def generate(site)
      if site.layouts.key? 'categories'
        dir = site.config['category_dir'] || 'categories'
        site.categories.keys.each do |category|
          write_category_index(site, File.join(dir, category), category)
        end
      end
    end

    def write_category_index(site, dir, category)
      index = CategoryIndex.new(site, site.source, dir, category)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
    end
  end
end
