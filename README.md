##Quiz App
Allows a user to create different quizzes and to add multiple-choice questions to those quizzes. Students can then take those quizzes and receive a score for that quiz.


REQUIREMENTS
------------
Ruby v 2.2.0

postgreSQL 9.4.0


INSTALLATION
------------
Run the following command to start the postgreSQL server:
```
$ postgres
```

Run the following command to access psql:
```
$ psql
```

Run the following command to create the databases:
```
$ rake db:create
```

Run the following command to populate the databases:
```
$ rake db:migrate
```

Run the following command to copy migrations to the test database:
```
$ rake db:test:prepare
```

Run the following command to install rspec:
```
$ gem install rspec
```

Run the following command to use rspec:
```
$ rspec
```

Run the following command to install bundler:
```
$ gem install bundler
```

Run the following command to install all required gems:
```
$ bundle
```

Run the following command to start the Sinatra server:
```
$ ruby app.rb
```


KNOWN BUGS
---------
No known bugs at this time.

AUTHOR
-------
Amy Michelle Johnson

amy.johnson.michelle@gmail.com

LICENSE
-------

Copyright (c) 2015  Amy Michelle Johnson

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
