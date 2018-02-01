require_relative '../../lib/atbash.rb'

describe Atbash do

  describe "encrypt" do
    let!(:atbash) { Atbash.new }

    it "returns encrypted text" do
      expect(atbash.encrypt(text: "abcd")).to eql('oeph')
    end

    it "works with nil" do
      expect(atbash.encrypt(text: nil)).to eql(nil)
    end
  end

  describe "decrypt" do
    let!(:atbash) { Atbash.new }

    it "returns decrypted text" do
      expect(atbash.decrypt(text: "knlfgnb, sj koqj o yvnewju")).to eql('houston, we have a problem')
    end

    it "works with nil" do
      expect(atbash.decrypt(text: nil)).to eql(nil)
    end
  end

  describe "validation" do
    before do
      ENV['CIPHER'] = 'test'
    end

    it 'raises exception if cipher is not correct' do
      expect { Atbash.new }.to raise_exception(Atbash::InvalidCipherException)
    end
  end
end