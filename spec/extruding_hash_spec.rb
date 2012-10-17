describe ExtrudingHash, "#<<" do

  it "Adds a column where all bins correspond" do
    test_value = ExtrudingHash.new
    test_value = { "a1|b1" => [ 1, 2, 3, 5 ], "a3|b3" => [ 2, 3, 5, 8 ],
        "a4|b4" => [ 3, 5, 8, 13 ] }

    test_value << { "a1|b1" => 21, "a3|b3" => 34, "a4|b4" => 55 }

    expected_value => {"a1|b1"=>[1, 2, 3, 5, 21],
        "a3|b3"=>[2, 3, 5, 8, 34], "a4|b4"=>[ 3, 5, 8, 13, 55]}

    test_value.should eq(expected_value)
  end

  it "Adds a column where all bins do not correspond" do
    test_value = ExtrudingHash.new
    test_value = { "a1|b1" => [ 1, 2, 3, 5 ], "a3|b3" => [ 2, 3, 5, 8 ],
        "a4|b4" => [ 3, 5, 8, 13 ] }

    test_value << { "a1|b1" => 21, "a2|b2" => 34, "a4|b4" => 55 }

    expected_value => {"a1|b1"=>[1, 2, 3, 5, 21],
        "a2|b2"=>[nil, nil, nil, 34], "a3|b3"=>[2, 3, 5, 8, nil],
        "a4|b4"=>[ 3, 5, 8, 13, 55]}

    test_value.should eq(expected_value)
  end

end
