module D1
  # The read replication mode for the database. Use 'auto' to create replicas and allow
  # D1 automatically place them around the world, or 'disabled' to not use any database
  # replicas (it can take a few hours for all replicas to be deleted).
  record ReadReplication, mode : Mode do
    include JSON::Serializable

    enum Mode
      AUTO
      DISABLED
    end
  end

  # The following hint locations are supported
  enum Location
    WNAM
    ENAM
    WEUR
    EEUR
    APAC
    OC
  end

  alias Any = String | Int32 | Int64 | Float64 | Bool
end
