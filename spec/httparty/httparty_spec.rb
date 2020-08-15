describe 'HTTParty' do
  it 'HTTParty' do
    stub_request(:get, 'https://jsonplaceholder.typicode.com/post/2')
        .to_return(status: 200, body: '', headers: { 'content-type': 'application/json' })

    response = HTTParty.get('https://jsonplaceholder.typicode.com/post/2')
    content_type = response.headers['content-type']

    expect(content_type).to(match(/application\/json/))
  end
end
