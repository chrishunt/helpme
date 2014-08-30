class StreamsController < ApplicationController
  def index
    redirect_to new_stream_path
  end

  def new
    @stream = Stream.new
  end

  def create
    stream = Stream.new(comments: params['stream']['comments'])
    redirect_to stream.init!
  end

  def destroy
    Stream.find_by(slug: params['id']).destroy!
    redirect_to new_stream_path
  end

  def show
    @stream = Stream.find_by(slug: params['id'])
    @token = OPENTOK.generate_token @stream.opentok_id
  end
end
