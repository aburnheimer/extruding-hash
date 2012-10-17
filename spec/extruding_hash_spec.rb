require File.expand_path File.join(File.dirname(__FILE__), '../lib/extruding-hash/extruding_hash')

describe ExtrudingHash, "#columns" do
  it "returns the number of columns contained" do
    test_value = ExtrudingHash.new.set_from_hash( { "a1|b1" => [ 1, 2, 3, 5 ],
        "a3|b3" => [ 2, 3, 5, 8 ], "a4|b4" => [ 3, 5, 8, 13 ] } )

    test_value.columns.should eq(4)
  end

  it "works with empty structures" do
    test_value = ExtrudingHash.new

    test_value.columns.should eq(nil)
  end
end

describe ExtrudingHash, "#normalize!" do
  it "can modify itself such that all bins' value-arrays are as wide as the widest" do
    test_value = ExtrudingHash.new.set_from_hash( { "a1|b1" => [ 1, 2, 3 ],
        "a3|b3" => [ 2, 3, 5, 8 ] } )
    test_value.normalize!

    expected_value = { "a1|b1" => [ 1, 2, 3, nil], "a3|b3" => [ 2, 3, 5, 8 ] }

    test_value.should eq(expected_value)
  end

  it "works with empty structures" do
    test_value = ExtrudingHash.new
    test_value.normalize!

    test_value.should eq({ })
  end
end

describe ExtrudingHash, "#<<" do
  it "adds a column where all bins correspond" do
    test_value = ExtrudingHash.new.set_from_hash( { "a1|b1" => [ 1, 2, 3, 5 ],
        "a3|b3" => [ 2, 3, 5, 8 ], "a4|b4" => [ 3, 5, 8, 13 ] } )

    test_value << { "a1|b1" => 21, "a3|b3" => 34, "a4|b4" => 55 }

    expected_value = {"a1|b1"=>[1, 2, 3, 5, 21],
        "a3|b3"=>[2, 3, 5, 8, 34], "a4|b4"=>[ 3, 5, 8, 13, 55]}

    test_value.should eq(expected_value)
  end

  it "adds a column where all bins do not correspond" do
    test_value = ExtrudingHash.new.set_from_hash( { "a1|b1" => [ 1, 2, 3, 5 ],
        "a3|b3" => [ 2, 3, 5, 8 ], "a4|b4" => [ 3, 5, 8, 13 ] } )

    test_value << { "a1|b1" => 21, "a2|b2" => 34, "a4|b4" => 55 }

    expected_value = {"a1|b1"=>[1, 2, 3, 5, 21],
        "a2|b2"=>[nil, nil, nil, nil, 34], "a3|b3"=>[2, 3, 5, 8, nil],
        "a4|b4"=>[ 3, 5, 8, 13, 55]}

    test_value.should eq(expected_value)
  end

  it "works with empty columns" do
    test_value = ExtrudingHash.new.set_from_hash( { "a1|b1" => [ 1, 2, 3, 5 ],
        "a3|b3" => [ 2, 3, 5, 8 ], "a4|b4" => [ 3, 5, 8, 13 ] } )

    test_value << { }

    expected_value = { "a1|b1" => [ 1, 2, 3, 5 ],
        "a3|b3" => [ 2, 3, 5, 8 ], "a4|b4" => [ 3, 5, 8, 13 ] }

    test_value.should eq(expected_value)
  end

  it "works with nil columns" do
    test_value = ExtrudingHash.new.set_from_hash( { "a1|b1" => [ 1, 2, 3, 5 ],
        "a3|b3" => [ 2, 3, 5, 8 ], "a4|b4" => [ 3, 5, 8, 13 ] } )

    test_value << nil

    expected_value = { "a1|b1" => [ 1, 2, 3, 5 ],
        "a3|b3" => [ 2, 3, 5, 8 ], "a4|b4" => [ 3, 5, 8, 13 ] }

    test_value.should eq(expected_value)
  end

  it "adds a column to an empty structure" do
    test_value = ExtrudingHash.new
    test_value << { "a1|b1" => 21, "a2|b2" => 34, "a4|b4" => 55 }

    expected_value = { "a1|b1" => [ 21 ], "a2|b2" => [ 34 ],
        "a4|b4" => [ 55 ] }

    test_value.should eq(expected_value)
  end
end
