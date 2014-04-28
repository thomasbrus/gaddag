# encoding: utf-8

shared_examples 'GADDAG::Node#create_final_path/behaviour' do
  include_context 'GADDAG::Node#create_path/context'

  let!(:final_node) { subject.create_final_path(letters) }

  let(:letters_without_last_one) { letters[0..-2] }
  let(:letters_without_last_two) { letters[0..-3]}

  let(:last_letter) { letters[-1] }
  let(:second_last_letter) { letters[-2] }

  it 'creates the path for the given letters up till the second last letter' do
    expect { subject.follow_arcs(letters_without_last_one) }.to_not raise_error
  end

  it 'does not create an arc for the last letter' do
    expect { subject.follow_arcs(letters) }.to raise_error(KeyError)
  end

  it 'adds the last letter to the last arc as final letter' do
    expect(subject.follow_arcs(letters_without_last_two).outgoing_arcs).to eq({
      second_last_letter.to_sym => GADDAG::Arc.new(GADDAG::Node.new).tap do |arc|
        arc.add_final_letter(last_letter)
      end
    })
  end

  it 'returns the last created node' do
    expect(final_node).to equal(subject.follow_arcs(letters_without_last_one))
  end
end
