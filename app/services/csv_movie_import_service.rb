class CsvMovieImportService
  require 'csv'

  def call(file)
    opened_file = File.open(file)
    options = { headers: true, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|

      movie_hash = {}
      movie_hash[:title] = row['Movie']
      movie_hash[:description] = row['Description']
      movie_hash[:director] = row['Director']
      movie_hash[:year] = row['Year']
      
      filming_hash = {}
      filming_hash[:actor] = row['Actor']
      filming_hash[:filming_location] = row['Filming location']
      filming_hash[:country] = row['Country']

      @mov = Movie.find_or_create_by!(movie_hash)
      filming_hash[:movie_id] = @mov[:id]

      Filming.find_or_create_by!(filming_hash)
    end
  end
end
