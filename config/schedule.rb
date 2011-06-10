# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
set :output, {:error => "/home/rails/affiliate/log/text.txt", :standard => "/home/rails/affiliate/log/text1.txt" }
# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
every 1.day, :at => '11.58 pm' do
  runner "Transaction.pull_report_from_linkshare"
end

# Learn more: http://github.com/javan/whenever

