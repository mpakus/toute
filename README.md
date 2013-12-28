TOUTE
====
Open classifieds platform

Screenshot
====
![Alt text](http://monosnap.com/image/QwR6YaE0ZXb4j48ejcDBUhYd5.png)

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

Versions
====

0.3
- shows last classifieds on main page
- check owner and admin privileges
- edit toute photos

0.2
- pagination
- photos for each classified
- breadcrumbs navigation

0.1
- classifieds
- social authorization
- simple search & output