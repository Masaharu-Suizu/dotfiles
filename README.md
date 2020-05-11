# require
Need to install PHP modules via composer.
```
$ composer global require friendsofphp/php-cs-fixer
$ composer global require squizlabs/php_codesniffer
$ composer global require phpstan/phpstan
$ composer global require felixfbecker/language-server jetbrains/phpstorm-stubs:@dev
$ composer global run-script --working-dir ~/.config/composer/vendor/felixfbecker/language-server parse-stubs
```
