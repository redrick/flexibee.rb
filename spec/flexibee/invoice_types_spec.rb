describe Flexibee::InvoiceTypes, vcr: true do
  describe '#initialize' do
    it 'gets basic invoice types response' do
      VCR.use_cassette 'invoice_types/api_response' do
        types = @flexibee.invoice_types
        expect(types).not_to be_empty
        expect(types).to all( be_an(Flexibee::InvoiceType) )
      end
    end
  end

  describe '#InvoiceType' do
    before do
      VCR.use_cassette 'invoice_types/api_response' do
        @example = @flexibee.invoice_types.first
      end
    end

    it 'gets type id' do
      expect(@example.id).to eql("39")
    end

    it 'gets type updated_at' do
      expect(@example.updated_at).to eql("2015-05-30T13:11:01.534+02:00")
    end

    it 'gets type code' do
      expect(@example.code).to eql("DOBROPIS ESHOP CZ")
    end

    it 'gets type name' do
      expect(@example.name).to eql("Opravný daňový doklad")
    end

    it 'gets type currency' do
      expect(@example.currency).to eql("CZK")
    end

    it 'gets type currency_ref' do
      expect(@example.currency_ref).to eql("/c/esperia_test/mena/31.json")
    end

    it 'gets type currency_name' do
      expect(@example.currency_name).to eql("Česká koruna")
    end
  end
end
