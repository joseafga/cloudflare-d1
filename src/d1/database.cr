module D1
  def self.open(uuid, & : Database -> _)
    db = Database.new(uuid)

    yield db
  end

  # The details of the D1 database.
  struct Database
    include JSON::Serializable

    # Specifies the timestamp the resource was created as an ISO8601 string. *(Optional)*
    getter! created_at : Time
    # The D1 database's size, in bytes. *(Optional)*
    getter! file_size : Int32
    # D1 database name. *(Optional)*
    getter! name : String
    # *(Optional)*
    getter! num_tables : Int32
    # *(Optional)*
    getter! running_in_region : Location
    # Configuration for D1 read replication. *(Optional)*
    getter! read_replication : ReadReplication
    # D1 database identifier (UUID). *(Optional)*
    getter! uuid : String
    # *(Optional)*
    getter! version : String

    def initialize(@uuid)
    end

    def exec(query, *values, args = [] of Any) : Nil
      values.each do |value|
        args.push value
      end

      Api.raw(uuid, query, args)
      Nil
    end

    def query(query, *values, args = [] of Any)
      values.each do |value|
        args.push value
      end

      Api.query(uuid, query, args)
    end

    def raw(query, *values, args = [] of Any)
      values.each do |value|
        args.push value
      end

      Api.raw(uuid, query, args)
    end
  end
end
