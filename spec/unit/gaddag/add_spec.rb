# encoding: utf-8

require 'gaddag'

describe GADDAG, '#add' do
  subject { GADDAG.new }

  it 'returns itself' do
    expect(subject.add('ANYTHING')).to equal(subject)
  end

  context 'given that the word BREAK is added' do
    before { subject.add('BREAK') }

    it 'creates a final path for K-A-E-R-B' do
      final_node = subject.root.follow_path(%w[K A E])
      expect(final_node.outgoing_arcs).to have_key(:R)
      expect(final_node.outgoing_arcs[:R].final_letters).to eq(Set.new(['B']))
    end

    it 'creates a final path for B-♢-R-E-A-K' do
      final_node = subject.root.follow_path(%w[B] + [GADDAG::Path::DELIMITER] + %w[R E])
      expect(final_node.outgoing_arcs).to have_key(:A)
      expect(final_node.outgoing_arcs[:A].final_letters).to eq(Set.new(['K']))
    end

    it 'creates a final path for R-B-♢-E-A-K' do
      final_node = subject.root.follow_path(%w[R B] + [GADDAG::Path::DELIMITER] + %w[E])
      expect(final_node.outgoing_arcs).to have_key(:A)
      expect(final_node.outgoing_arcs[:A].final_letters).to eq(Set.new(['K']))
    end

    it 'creates a final path for E-R-B-♢-A-K' do
      final_node = subject.root.follow_path(%w[E R B] + [GADDAG::Path::DELIMITER])
      expect(final_node.outgoing_arcs).to have_key(:A)
      expect(final_node.outgoing_arcs[:A].final_letters).to eq(Set.new(['K']))
    end

    it 'creates a final path for A-E-R-B-♢-K' do
      final_node = subject.root.follow_path(%w[A E R B])
      expect(final_node.outgoing_arcs).to have_key(GADDAG::Path::DELIMITER.to_sym)
      final_letters = final_node.outgoing_arcs[GADDAG::Path::DELIMITER.to_sym].final_letters
      expect(final_letters).to eq(Set.new(['K']))
    end
  end
end
