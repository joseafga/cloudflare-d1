# D1

[Cloudflare API](https://developers.cloudflare.com/api/resources/d1/subresources/database/) for D1 databases written in Crystal.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     d1:
       github: joseafga/d1
   ```

2. Run `shards install`

## Usage

```crystal
require "d1"
```

#### Configure credentials

```crystal
D1.configure do |config|
  config.account_id = "023e105f4ecef8ad9ca31a8372d0c353"
  config.api_token = "Sn3lZJTBX6kkg7OdcBUAxOO963GEIyGQqnFTOFYY"
end
```

#### Run SQL

```crystal
D1.open("database-uuid") do |db|
  db.exec "CREATE TABLE Users (id INTEGER PRIMARY KEY, name TEXT NOT NULL, age INTEGER);"
  db.exec "INSERT INTO Users (name, age) VALUES ('Billy', 30)"
  result = db.query "SELECT * FROM Users WHERE age = ?", 30

  puts result.first["name"].as_s # => Billy
end
```

## Contributing

1. Fork it (<https://github.com/joseafga/d1/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [José Almeida](https://github.com/joseafga) - creator and maintainer
