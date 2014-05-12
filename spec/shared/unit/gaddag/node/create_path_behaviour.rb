# encoding: utf-8

shared_examples 'GADDAG::Node#create_path/behaviour' do
  include_context 'GADDAG::Node#create_path/context'

  let!(:final_node) { subject.create_path(letters) }

  it 'creates the path for the given letters' do
    expect { subject.follow_path(letters) }.to_not raise_error
  end

  it 'returns the last created node' do
    expect(final_node).to equal(subject.follow_path(letters))
  end
end
