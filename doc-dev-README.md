## Set up environment (Windows)
- install [RubyInstallers](https://rubyinstaller.org/downloads/) with MSYS2 (Ruby+Devkit 2.5.3-1 (x64)) and [RubyGems](https://rubygems.org/pages/download) or upgrate to the lastest RubyGems by executing command`$ gem update --system`;
- use RubyGems to install Jekyll: `$ gem install jekyll`;
- enter local directory of IDA-doc and execute command `$ bundle install` and `$ jekyll serve` to start server;
- a development server will run in http://127.0.0.1:4000/IDA-doc/.

## Add a new document post
- Create a new document file in folder _posts, named as **YYYY-mm-dd-{category}-{doc-name}.md**
- Set the document title and category in its YAML header
- Set the document date and last modified date as well. Note: the value of the date sets the PREVIOUS/NEXT order of documents. The value of the last modified sets the _Updated:_ field on document page. 
- Update _data/navigation.yml to link this document in the sidebar. 
  1. Add a children element under some title
  2. Set the title of the children element, to be displayed in the siderbar
  3. Set the url of the children element to be **{category}-{doc-name}.html**

## Reference
- http://bruth.github.io/jekyll-docs-template
- http://jekyllcn.com
- https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/

## Export Docx
- Install pandoc first. Then enter local directory of IDA-doc.
- $ chmod 777 docxAndPdf.sh
- $ ./docxAndPdf.sh