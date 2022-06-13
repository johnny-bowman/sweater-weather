class Api::V1::BooksController < ApplicationController
  def index
    book_results = BookFacade.get_books(params[:location], params[:quantity])

    coordinates = MapFacade.get_coordinates(params[:location])

    forecast = ForecastFacade.get_forecast(coordinates.lat, coordinates.lng)

    render json: BookSerializer.books(book_results, params[:location], forecast)
  end
end
