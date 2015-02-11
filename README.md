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

Versions
====

0.6
- updated to stable Rails 4.2

0.5
- Comments, now user can leave it and owner of toute to delete them
- updated to stable Rails 4.1.5

0.4
- fresh Rails 4.1.4
- Bootstrap SASS
- design fixes

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