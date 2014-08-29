module SortHelper
  def search_sort_by
    if params[:column]
      order = 'asc'
      # order

      if params[:order] == 'asc'
        order = 'desc'
      end
      {column: params[:column], order: order}
    else
      {column: "rating", order: "asc"}
    end
  end
end