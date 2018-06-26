# Spikeball

What about learning a bit of Hanami building an app to handle spikeball tournaments?

## Setup

```
git clone git@github.com:sallesma/spikeball-tournament.git
cd spikeball-tournament
gem install bundler
bundle install
bundle exec hanami db prepare
HANAMI_ENV=test bundle exec hanami db prepare
```

## Usage

How to run tests:
```
% bundle exec rake test
```

How to run the development console:
```
% bundle exec hanami console
```

How to run the development server:
```
% bundle exec hanami server
```

Explore Hanami [guides](http://hanamirb.org/guides/)
