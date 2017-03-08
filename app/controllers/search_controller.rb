class SearchController < ApplicationController
  def search
    @query = params[:query]
    @results = PgSearch.multisearch(@query).limit(50).with_pg_search_highlight
    puts @results.first.pg_search_highlight if @results.first
  end
end


