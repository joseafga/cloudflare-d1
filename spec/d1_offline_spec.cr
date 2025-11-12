require "./spec_helper"

describe D1 do

  it "List D1 Databases" do
    D1::Response(Array(D1::Database)).from_json Samples.load_json("response_list")
  end

  it "Get D1 Database" do
    D1::Response(D1::Database).from_json Samples.load_json("response_get")
  end

  it "Get D1 Database with error" do
    response = D1::Response(D1::Database).from_json Samples.load_json("response_get_error")

    ex = expect_raises(D1::ResponseError) do
      response.to_result
    end

    ex.info.first.code.should eq 7404
  end

  it "Query D1 Database with error on params" do
    response = D1::Response(JSON::Any).from_json Samples.load_json("response_query_error")

    ex = expect_raises(D1::ResponseError) do
      response.to_result
    end

    ex.info.first.code.should eq 7400
  end
end
