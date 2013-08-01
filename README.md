toute
====
Social classifieds platform

Main user flow
====
- Login with social platform  (Facebook, twitter, etc...)
- Leave ad in classifieds (with text, picture)
- Cross-post to social platforms

Additional
===
- API
- Android, iPhone app following

Possible problems
====
If error __"Incorrect MySQL client library version! This gem was compiled for 5.5.29 but the client library is 5.6.12."__

Execute this:

    bundle exec gem install mysql2 -- –with-mysql-config=/usr/local/bin/mysql_config ARCHFLAGS="-arch x86_64"

If error __"dlopen(/Users/lun/.rvm/gems/ruby-2.0.0-p247@tout/gems/rmagick-2.13.2/lib/RMagick2.bundle, 9): Library not loaded: /usr/local/lib/libMagickCore-Q16.7.dylib"__ 

Execute this:

    gem pristine rmagick