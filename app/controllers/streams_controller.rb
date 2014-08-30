class StreamsController < ApplicationController
  def index
    redirect_to new_stream_path
  end

  def new
    @stream = Stream.new
  end

  def create
    stream = Stream.create!(
      comments: params['stream']['comments'],
      opentok_id: opentok.create_session.session_id
    )

    redirect_to stream
  end

  def show
    @stream = Stream.find(params['id'])
    @token = opentok.generate_token @stream.opentok_id
  end

  private

  def opentok
    require 'opentok'
    OpenTok::OpenTok.new OPENTOK_API_KEY, OPENTOK_API_SECRET
  end
end
