class SecretFile
  attr_reader :filename
  def initialize(filename, secret_data, security_logger)
    @filename = filename
    @data = secret_data
    @logger = security_logger
  end
  
  def data
    @logger.create_log_entry(self)
    @data
  end
end

class SecurityLogger
  def create_log_entry(file)
    puts "#{file.filename}, #{Time.now}"
  end
end

file1 = SecretFile.new('file1', '12345', SecurityLogger.new)
file1.data
file1.data
file1.data