# Server

This is a rails server to fetch satellites from the SpaceX API, process them, and expose them via a graphql API.

## Setup

1. Navigate to this directory (assuming you started at the repo root)

```
cd server
```

2. Install bundler (if you don't have it)

```
gem install bundler
```

3. Install dependencies

```
bundle install
```

4. Run the app
```
bin/rails s
```

## Tooling

The server app was generated with the standard new application generator and still retains much of the scaffold code from that generator.

Here are some tools I used on top of rails for app development:
- [graphql ruby](https://github.com/rmosolgo/graphql-ruby): ruby implementation of graphql
- [graphiql rails](https://github.com/rmosolgo/graphiql-rails): graphiql ide to visualize graphql calls during development
- [rack cors](https://github.com/cyu/rack-cors): middleware to support cors
- [pry](https://github.com/pry/pry): runtime dev console for debugging
- [httparty](https://github.com/jnunemaker/httparty): simple http client
- [haversine](https://github.com/kristianmandrup/haversine): distance calculation gem

## Testing

Tests leverage [rspec](https://github.com/rspec/rspec) and follow expected rspec conventions. Graphql types are tested using the matchers provided by the [rspec graphql matchers](https://github.com/khamusa/rspec-graphql_matchers) gem. I considered mocking API calls with a specific mocking gem or by storing API responses via vcr but ultimately decided to just mock the classes directly. This felt like a simple, lightweight solution for unit tests.

Run tests with the `rspec` command.
