# Simple progress indicator
class ProgressIndicator
  def begin
    print '== Seeding sample data'
  end

  def next
    print '.'
  end

  def end
    puts '[OK]'
    puts '-- Data is ready'
  end
end

# Seed the database
prog_indicator = ProgressIndicator.new
prog_indicator.begin

cities  = Cities::Repository.seed(prog_indicator)
Companies::Repository.seed(cities, prog_indicator)
People::Repository.seed(cities, prog_indicator)

prog_indicator.end