# encoding: utf-8

require 'gaddag'

describe GADDAG, '#add' do
  subject { GADDAG.new }
  let(:path_delimiter) { GADDAG::Path::DELIMITER }

  it 'returns itself' do
    expect(subject.add('ANYTHING')).to equal(subject)
  end

  context 'given that the word BREAK is added' do
    before { subject.add('BREAK') }

    it 'creates a final path for K-A-E-R-B-♢' do
      final_node = subject.root.follow_path(%w[K A E R])
      expect(final_node.outgoing_arcs).to have_key(:B)
      expect(final_node.outgoing_arcs[:B].final_letters).to eq([path_delimiter].to_set)
    end

    it 'creates a final path for B-♢-R-E-A-K' do
      final_node = subject.root.follow_path(%w[B] + [path_delimiter] + %w[R E])
      expect(final_node.outgoing_arcs).to have_key(:A)
      expect(final_node.outgoing_arcs[:A].final_letters).to eq(['K'].to_set)
    end

    it 'creates a final path for R-B-♢-E-A-K' do
      final_node = subject.root.follow_path(%w[R B] + [path_delimiter] + %w[E])
      expect(final_node.outgoing_arcs).to have_key(:A)
      expect(final_node.outgoing_arcs[:A].final_letters).to eq(['K'].to_set)
    end

    it 'creates a final path for E-R-B-♢-A-K' do
      final_node = subject.root.follow_path(%w[E R B] + [path_delimiter])
      expect(final_node.outgoing_arcs).to have_key(:A)
      expect(final_node.outgoing_arcs[:A].final_letters).to eq(['K'].to_set)
    end

    it 'creates a final path for A-E-R-B-♢-K' do
      final_node = subject.root.follow_path(%w[A E R B])
      expect(final_node.outgoing_arcs).to have_key(path_delimiter.to_sym)
      expect(final_node.outgoing_arcs[path_delimiter.to_sym].final_letters).to eq(['K'].to_set)
    end
  end
end
