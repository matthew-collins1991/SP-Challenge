require 'pry'

class Parser

  def initialize(file)
    @@log = File.new(file)
    # turn file into array
    @@log_array = IO.readlines(@@log)
  end


  def get_log
    puts 'Total Page Visits:'
    count_site_visits(@@log_array)
    puts ""
    puts "Total Unique Visits:"
    remove_duplicate_visits(@@log_array)
  end

  # ============ total site visit section ============


  def count_site_visits(log_array)
    @sites_array = log_array.map { |line| line.split[0]  }
    # create histogram
    @visit_count = Hash[*@sites_array.group_by{ |v| v }.flat_map{ |k, v| [k, v.size] }]
    order_log_by_visit_count(@visit_count)
  end


  def order_log_by_visit_count(visit_count)
    @ordered_count = visit_count.sort_by{|key,value| value}.reverse
    create_table(@ordered_count)
  end


  def create_table(ordered_count)
    @rows = ordered_count
    @table = Terminal::Table.new :headings => ['Page', 'Visits'], :rows => @rows
    puts @table
  end

# ========= unique sites section ===========

  def remove_duplicate_visits(log_array)
    @unique_visits_array = log_array.uniq
    count_site_visits(@unique_visits_array)
  end

end
