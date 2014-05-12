# encoding: utf-8

require 'gaddag'

describe GADDAG::Node, '#follow_path' do
  subject { GADDAG::Node.new }

  let(:letter) { 'L' }
  let(:destinations) { GADDAG::Node.new }

  context 'when the path for the given letters exists' do
    context 'when given an empty path of letters' do
      let(:letters) { [] }
      before { subject.create_path(letters) }

      it 'returns itself' do
        expect(subject.follow_path(letters)).to equal(subject)
      end
    end

    context 'when given a path of letters' do
      let(:letters) { %w[A B C D] }
      let(:destinations) { 4.times.map { GADDAG::Node.new } }
      before { subject.create_path(letters, destinations) }

      it 'returns the destination node that the path of letters leads to' do
        expect(subject.follow_path(letters)).to equal(destinations.last)
      end
    end
  end

  context 'when the path for the given letters does not exist' do
    let(:letters) { %w[A B C D] }
    let(:other_letters) { %w[A X Y D] }
    before { subject.create_path(letters) }

    it 'raises an error indicating that no such path exists' do
      expect { subject.follow_path(other_letters) }.to raise_error(KeyError)
    end
  end
end
