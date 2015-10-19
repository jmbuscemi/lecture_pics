## TIY Durham Rail Lecture Pictures
This app is for TAs in the Iron Yard Durham Ruby/Rails class to upload lecture pictures for the instructor to post on the course website.  I know...this could just be done in a number of different (probably easier) ways, but I just wanted to make a rails app, because coding is neat!

## Use
* Users upload pictures to the app and can share the link via copy/paste.
* Files are uploaded to an AWS bucket through environment variables.
  * These variables are can be found in `config/applicationl.rb` as the the following:

      ```ruby
      :bucket => ENV['TIY_TA_AWS_BUCKET'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      ```

## Contribute to this
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork it.
* Start a feature/bugfix branch - `git checkout -b feature`.
* Commit and push until you are happy with your contribution.
* **Make sure to add tests for it.** This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

### Copyright
Copyright (c) 2015 John M Buscemi. See LICENSE.txt for
further details.
