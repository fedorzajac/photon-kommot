require "minitest/autorun"
require "photon_komoot"

class PhotonKomootIOTest < Minitest::Test
  def test_search
    photon = PhotonKomootIO.new
    res = photon.search("bratislava").has_key?(:features)
    p res
    assert_equal true, res
  end
end
