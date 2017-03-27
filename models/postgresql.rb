Model.new(:postgresql, 'PostgreSQL backup') do
  compress_with Gzip

  database PostgreSQL do |db|
    db.name               = ENV['POSTGRESQL_DATABASE']
    db.username           = ENV['POSTGRESQL_USER']
    db.password           = ENV['POSTGRESQL_PASSWORD']
    db.host               = ENV['POSTGRESQL_HOST']
    db.port               = ENV['POSTGRESQL_PORT']
    db.additional_options = []
  end

  store_with S3 do |s3|
    s3.access_key_id = ENV['AWS_ACCESS_KEY_ID']
    s3.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    s3.region = ENV['AWS_REGION']
    s3.bucket = ENV['AWS_BUCKET']
    s3.path = ENV['AWS_MYSQL_PATH']
  end
end
