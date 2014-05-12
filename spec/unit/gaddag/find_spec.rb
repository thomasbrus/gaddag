# encoding: utf-8

require 'gaddag'

describe GADDAG, '#find' do
  subject { GADDAG.new }

  context 'given that the words BREAK and AKIN are added' do
    before { subject.add('BREAK') }
    before { subject.add('AKIN') }

    context 'when searching for any word or substring that has not been added' do
      it 'yields no results' do
        expect(subject.find('ZOMBIES')).to be_empty
      end
    end

    context 'when searching for an empty substring' do
      let(:results) { subject.find('') }

      it 'yields all words that have been added' do
        expect(results).to eq(['BREAK', 'AKIN'])
      end
    end

    context 'when searching for a full word' do
      let(:results) { subject.find('BREAK') }

      it 'yields one result, namely the word that was searched for' do
        expect(results).to eq(['BREAK'])
      end
    end

    context 'when searching for the substring BREA' do
      let(:results) { subject.find('BREA') }

      it 'yields one result, namely BREAK' do
        expect(results).to eq(['BREAK'])
      end
    end

    context 'when searching for the substring REAK' do
      let(:results) { subject.find('REAK') }

      it 'yields one result, namely BREAK' do
        expect(results).to eq(['BREAK'])
      end
    end

    context 'when searching for the substring AK' do
      let(:results) { subject.find('AK') }

      it 'yields two results, namely BREAK and AKIN' do
        expect(results).to eq(['BREAK', 'AKIN'])
      end
    end
  end
end
