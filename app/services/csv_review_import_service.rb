class CsvReviewImportService
  require 'csv'

  def call(file)
    opened_file = File.open(file)
    options = { headers: true, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      
      review_hash = {}
      review_hash[:user] = row['User']
      review_hash[:stars] = row['Stars']
      review_hash[:review] = row['Review']

      @mov = Movie.find_by_title(row['Movie'])
      review_hash[:movie_id] = @mov[:id]

      Review.find_or_create_by!(review_hash)
    end
  end
end
