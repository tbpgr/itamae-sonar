# ItamaeSonar

ItamaeSonar search itamae plugin gems.

[Itamae](https://github.com/ryotarai/itamae) is Simple and lightweight configuration management tool inspired by Chef.

[![Gem Version](https://badge.fury.io/rb/itamae-sonar.svg)](http://badge.fury.io/rb/itamae-sonar)
[![Build Status](https://travis-ci.org/tbpgr/itamae-sonar.png?branch=master)](https://travis-ci.org/tbpgr/itamae-sonar)
[![Coverage Status](https://coveralls.io/repos/tbpgr/itamae-sonar/badge.png)](https://coveralls.io/r/tbpgr/itamae-sonar)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-sonar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-sonar

## Usage

### info
~~~ruby
require 'pp'
require 'itamae-sonar'
pp ItamaeSonar.info 'itamae'
__END__
{:name=>"itamae",
 :desc=>"Simple Configuration Management Tool",
 :downloads=>6894,
 :rubygems_uri=>"http://rubygems.org/gems/itamae",
 :homepage_uri=>"https://github.com/ryotarai/itamae"}
~~~

### random
~~~ruby
require 'pp'
require 'itamae-sonar'
pp ItamaeSonar.random
pp ItamaeSonar.random
__END__
# randome result
{:name=>"itamae-plugin-recipe-selinux",
 :desc=>"Itamae selinux recipe plugin",
 :downloads=>1065,
 :rubygems_uri=>"http://rubygems.org/gems/itamae-plugin-recipe-selinux",
 :homepage_uri=>""}
{:name=>"itamae-plugin-resource-ghq",
 :desc=>"Itamae resource plugin to manage repositories with ghq.",
 :downloads=>165,
 :rubygems_uri=>"http://rubygems.org/gems/itamae-plugin-resource-ghq",
 :homepage_uri=>"https://github.com/k0kubun/itamae-plugin-resource-ghq"}
~~~

### ranking
~~~ruby
require 'pp'
require 'itamae-sonar'
pp ItamaeSonar.ranking
__END__
[{:name=>"itamae-plugin-resource-mail_alias",
  :downloads=>1069,
  :authors=>"Gosuke Miyashita"},
 {:name=>"itamae-plugin-recipe-selinux",
  :downloads=>1065,
  :authors=>"Gosuke Miyashita"},
 {:name=>"itamae-plugin-resource-cask",
  :downloads=>628,
  :authors=>"Takashi Kokubun"},
 {:name=>"itamae-plugin-recipe-rtn_rbenv",
  :downloads=>308,
  :authors=>"Ru/MuckRu"},
 {:name=>"itamae-plugin-resource-ghq",
  :downloads=>165,
  :authors=>"Takashi Kokubun"}]
~~~

~~~ruby
require 'pp'
require 'itamae-sonar'
pp ItamaeSonar.ranking(3)
__END__
[{:name=>"itamae-plugin-resource-mail_alias",
  :downloads=>1069,
  :authors=>"Gosuke Miyashita"},
 {:name=>"itamae-plugin-recipe-selinux",
  :downloads=>1065,
  :authors=>"Gosuke Miyashita"},
 {:name=>"itamae-plugin-resource-cask",
  :downloads=>628,
  :authors=>"Takashi Kokubun"}]
~~~

###  author_ranking
~~~ruby
require 'pp'
require 'itamae-sonar'
pp ItamaeSonar.author_ranking
__END__
[{:authors=>"Gosuke Miyashita", :downloads=>2134},
 {:authors=>"Takashi Kokubun", :downloads=>915},
 {:authors=>"Ru/MuckRu", :downloads=>308},
 {:authors=>"Takatoshi Maeda", :downloads=>96}]
~~~

~~~bash
require 'itamae-sonar'
print ItamaeSonar.author_ranking(3)
__END__
[{:authors=>"Gosuke Miyashita", :downloads=>2134},
 {:authors=>"Takashi Kokubun", :downloads=>915},
 {:authors=>"Ru/MuckRu", :downloads=>308}]
~~~

## Usage (Command Line)
### Commands (Command Line)
|name|args|memo|
|:--|:--|:--|
|[info](#itamae-sonar-info)|gem name|Show target gem info. gem_name, descriptions, downloads, rubygems_url, homepage_url|
|[random](#itamae-sonar-random)|--|Show random gem info. gem_name, descriptions, downloads, rubygems_url, homepage_url|
|[ranking](#itamae-sonar-ranking)|limit|Show gem donloads ranking. default = 5|
|[author_ranking](#itamae-sonar-author_ranking)|limit|Show gem's authers donloads ranking. default = 5|

### itamae-sonar info
~~~bash
$ itamae-sonar info itamae
name:itamae
desc:Simple Configuration Management Tool
downloads:6894
rubygems_uri:http://rubygems.org/gems/itamae
homepage_uri:https://github.com/ryotarai/itamae
~~~

### itamae-sonar random
~~~bash
$ itamae-sonar random
name:itamae-plugin-recipe-rtn_rbenv
desc:Itamae Recipe 'rbenv'
downloads:308
rubygems_uri:http://rubygems.org/gems/itamae-plugin-recipe-rtn_rbenv
homepage_uri:https://github.com/rutan/itamae-plugin-recipe-rtn_rbenv

$ itamae-sonar random
name:itamae-plugin-recipe-rtn_rbenv
desc:Itamae Recipe 'rbenv'
downloads:308
rubygems_uri:http://rubygems.org/gems/itamae-plugin-recipe-rtn_rbenv
homepage_uri:https://github.com/rutan/itamae-plugin-recipe-rtn_rbenv

$ itamae-sonar random
name:itamae-plugin-recipe-rbenv
desc:Itamae plugin to install ruby with rbenv
downloads:122
rubygems_uri:http://rubygems.org/gems/itamae-plugin-recipe-rbenv
homepage_uri:https://github.com/k0kubun/itamae-plugin-recipe-rbenv
~~~

### itamae-sonar ranking
~~~bash
$ itamae-sonar ranking
no:1,name:itamae-plugin-resource-mail_alias,downloads:1069
no:2,name:itamae-plugin-recipe-selinux,downloads:1065
no:3,name:itamae-plugin-resource-cask,downloads:628
no:4,name:itamae-plugin-recipe-rtn_rbenv,downloads:308
no:5,name:itamae-plugin-resource-ghq,downloads:165

$ itamae-sonar ranking 3
no:1,name:itamae-plugin-resource-mail_alias,downloads:1069
no:2,name:itamae-plugin-recipe-selinux,downloads:1065
no:3,name:itamae-plugin-resource-cask,downloads:628
~~~

### itamae-sonar author_ranking
~~~bash
$ itamae-sonar author_ranking
no:1,author:Gosuke Miyashita,downloads:2134
no:2,author:Takashi Kokubun,downloads:915
no:3,author:Ru/MuckRu,downloads:308
no:4,author:Takatoshi Maeda,downloads:96

$ itamae-sonar author_ranking 3
no:1,author:Gosuke Miyashita,downloads:2134
no:2,author:Takashi Kokubun,downloads:915
no:3,author:Ru/MuckRu,downloads:308
~~~

## Dependency
* itamae-sonar depend on [gems gem](https://github.com/rubygems/gems)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/itamae-sonar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
