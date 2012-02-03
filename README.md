Sinatra AWS S3 Rack App
=======================

Rack application to create signed policies for amazon s3 uploading.

    $ cd
    $ git clone git@github.com:namelessnotion/sinatra-aws-s3.git

Put these some place where it will be ran (.bash_profile or .zshrc for example)

    export AMAZON_ACCESS_KEY_ID=your_access_key_id
    export AMAZON_SECRET_ACCESS_KEY=your_access_key_secret

I'd install rbenv https://github.com/sstephenson/rbenv and ruby-build https://github.com/sstephenson/ruby-build

compile and install ruby 1.9.2p290 with rbenv

    $ cd sinatra-aws-s3
    $ gem install bundler
    $ bundler install
    $ bundle exec thin start
