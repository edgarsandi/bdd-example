# BDD example #

_This repository contains the gherkin steps to test the example api_


## Steps to install:

### Clone this project
```bash
cd <your projects path>
git clone git@bitbucket.org:dafiti/bdd-example.git
```

### Install the composer packages
If you don't have composer installed
```bash
curl -sS https://getcomposer.org/installer | php

```

Then run composer
```bash
php composer.phar update
```

### Copy the config file
```bash
cp behat.yml.dist behat.yml
```

### Change base_url settings in behat.yml
By default the base_url is http://example.dev, if you want to test other url change the line:
```bash
from: base_url: http://example.dev/
  to: base_url: http://<the api url>/
```

### To run the api behabior tests with behat
```bash
vendor/bin/behat --suite api
```

## Using the example api in local environment
### Clone the example api repository
```bash
git clone git@bitbucket.org:dafiti/example.git
```

### Follow the [installation instructions](https://bitbucket.org/dafiti/example/overview)

# And Enjoy! :grinning: #