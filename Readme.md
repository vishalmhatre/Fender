### Fender Automation Test

#### Installation

* Please check you have ruby 2.0 or higher by typing `ruby -v` in terminal.

* `gem install bundler` to install bundler.

* `bundle install` from root directory to install all dependencies.

* make sure you have chrome browser installed. chrome binary will be installed in `usr/local/bin`


#### To Run the project

* cd into `tests` folder and type `ruby fenderSmokeTest.rb`

* should provide the output like below:

```
navigation successful
catalog page navigation successful
product page navigation successful
add to cart successful
cart verified
on checkout page
shipping entered

```

#### Future Improvements

* Create Folder structure

* Create DSL file to execute all tests file in root of the directory

* Create PageObjects and group the tests

* Parameterize all the tests to pick-up data from a yaml file.

* Add api, database testing capabilities.
