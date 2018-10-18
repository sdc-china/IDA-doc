Keter Documentation https://sdc-china.github.io/keter-doc/

## Set up environment
- install [Ruby](https://www.ruby-lang.org/en/downloads/)(Ruby 2.4.3) and [RubyGems](https://rubygems.org/pages/download);
- use RubyGems to install Jekyll: `$ gem install jekyll`;
- enter local directory of keter-doc and execute command  `$ bundle exec jekyll serve` to start server;
- a development server will run in http://localhost:4000/.

## Reference
- http://bruth.github.io/jekyll-docs-template
- http://jekyllcn.com



## Doc Structure
    Overview
      what's new?
      
    Installation
      Keter war
      DB
      Deploy Checkstyle rules to RES
      BPM server
      Selenium Hub
      plugin
      
    Tutorial
      Configuration(Add accounts, BPM servers and Selenium hubs)--link to administration
      Create a test project and generate test cases
      Record and replay a test case--link to create a reusable group command and record and replay another test case with the         group command
      Perform Checkstyle
      Create a pipeline for Continuous Deployment
      
    Test
      Create/Update a test project
      Create/Update a BPD test case
      Create/Update a unit test case
      Record and replay a test case
      Create/Update a reusable group command
      Record and replay another test case with the group command
      Import/Execute sample test project
      
    Checkstyle
      Perform Checkstyle
      Customize Checkstyle rules
      Report
      
    Pipeline
      Create a pipeline for Continuous Deployment
      Report
    
    Administration
      User management(create edit and delete)
      BPM configuration(create edit and delete)
      Selenium Hub configuration(create edit and delete)

    References
      API Reference
      System Requirements

    Help
      Trouble shooting
      FAQ


