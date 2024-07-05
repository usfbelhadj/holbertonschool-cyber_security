#!/usr/bin/env ruby

require 'optparse'

# Define TaskManager class to manage tasks
class TaskManager
  attr_reader :tasks

  def initialize
    @tasks = load_tasks
  end

  def add_task(task)
    @tasks << task
    save_tasks
    puts "Task '#{task}' added."
  end

  def list_tasks
    if @tasks.empty?
      puts "No tasks."
    else
      puts "Tasks:"
      @tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end
  end

  def remove_task(index)
    if index >= 1 && index <= @tasks.length
      task = @tasks.delete_at(index - 1)
      save_tasks
      puts "Task '#{task}' removed."
    else
      puts "Invalid task index."
    end
  end

  private

  def load_tasks
    if File.exist?('tasks.txt')
      File.readlines('tasks.txt').map(&:chomp)
    else
      []
    end
  end

  def save_tasks
    File.open('tasks.txt', 'w') do |file|
      @tasks.each { |task| file.puts task }
    end
  end
end

# Initialize TaskManager
task_manager = TaskManager.new

# Option parser for CLI commands
OptionParser.new do |parser|
  parser.banner = "Usage: #{File.basename($PROGRAM_NAME)} [options]"

  parser.on("-aTASK", "--add TASK", "Add a new task") do |task|
    task_manager.add_task(task)
  end

  parser.on("-l", "--list", "List all tasks") do
    task_manager.list_tasks
  end

  parser.on("-rINDEX", "--remove INDEX", Integer, "Remove a task by index") do |index|
    task_manager.remove_task(index)
  end

  parser.on("-h", "--help", "Show this message") do
    puts parser
    exit
  end
end.parse!

# Print help message if no arguments are provided
if ARGV.empty?
  puts OptionParser.new.help
end
